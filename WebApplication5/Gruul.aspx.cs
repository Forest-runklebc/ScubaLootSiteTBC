using AjaxControlToolkit;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication5
{
    public partial class BlackwingLair : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarGruul.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarGruul, labelRaidsRun);
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            // ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            if (FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".xlsx")
            {
                using (var excel = new OfficeOpenXml.ExcelPackage(FileUpload1.PostedFile.InputStream))
                {
                    ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                    var tbl = new DataTable();
                    var ws = excel.Workbook.Worksheets[0];
                    var hasHeader = true;  // adjust accordingly // add DataColumns to DataTable

                    foreach (var firstRowCell in ws.Cells[1, 1, 1, ws.Dimension.End.Column])
                    {
                        tbl.Columns.Add(hasHeader ? firstRowCell.Text : String.Format("Column {0}", firstRowCell.Start.Column));
                    }

                    // add DataRows to DataTable
                    int startRow = hasHeader ? 2 : 1;
                    for (int rowNum = startRow; rowNum <= ws.Dimension.End.Row; rowNum++)
                    {
                        var wsRow = ws.Cells[rowNum, 1, rowNum, ws.Dimension.End.Column];
                        DataRow row = tbl.NewRow();
                        foreach (var cell in wsRow)
                        {
                            row[cell.Start.Column - 1] = cell.Text;
                        }
                        tbl.Rows.Add(row);
                    }

                   
                    foreach (DataRow r in tbl.Rows)
                    {
                        int x = 5;
                        string playerName = r.ItemArray[0].ToString().Substring(0, r.ItemArray[0].ToString().IndexOf('-'));
                        string raidDate = r.ItemArray[1].ToString();
                        DateTime dt;
                        if (DateTime.TryParse(raidDate, out dt))
                        {
                            raidDate = dt.ToString("yyyy-MM-dd");
                        }
                        string[] splitHyperLink = r.ItemArray[3].ToString().Split(';');
                        int indexOfLeftBracket = splitHyperLink[1].IndexOf('[');
                        int indexOfRightBracket = splitHyperLink[1].IndexOf(']');
                        string itemName = splitHyperLink[1].Substring(indexOfLeftBracket + 1, indexOfRightBracket - 2).Replace("'", "''");
                        // string escapedItemName = itemName.Replace("'", @"\'\'");
                        string itemSpec = r.ItemArray[6].ToString(); // Mainspec/Need | Offspec/Greed | Minor Upgrade
                        string playerClass = r.ItemArray[8].ToString();
                        string equipLoc = r.ItemArray[17].ToString();
                        bool sidegrade = false;

                        if (itemSpec.Contains("Mainspec"))
                        {
                            itemSpec = "Mainspec";
                            sidegrade = false;
                        }
                        if (itemSpec.Contains("Minor"))
                        {
                            itemSpec = "Mainspec";
                            sidegrade = true;
                        }
                        if (itemSpec.Contains("Offspec"))
                        {
                            itemSpec = "Offspec";
                            sidegrade = false;
                        }                      

                        Utility.InsertPlayerlootQuery(playerName, itemName, itemSpec, raidDate, sidegrade);

                    }

                    var msg = String.Format("Loot successfully uploaded to database");
                    UploadStatusLabel.Text = msg;
                }
            }
            else
            {
                UploadStatusLabel.Text = "You did not specify a file to upload.";
            }
        }


        protected void WriteToDatabase_Click(object sender, EventArgs e)
        {
            string dateOfRaid = calendarGruul.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboMaulgarPlayer1.SelectedValue, comboMaulgarLoot1.SelectedValue, radioMaulgar1.SelectedValue, dateOfRaid, checkboxMaulgar1.Checked);
            Utility.InsertPlayerlootQuery(comboMaulgarPlayer2.SelectedValue, comboMaulgarLoot2.SelectedValue, radioMaulgar2.SelectedValue, dateOfRaid, checkboxMaulgar2.Checked);
            Utility.InsertPlayerlootQuery(comboMaulgarPlayer3.SelectedValue, comboMaulgarLoot3.SelectedValue, radioMaulgar3.SelectedValue, dateOfRaid, checkboxMaulgar3.Checked);
            Utility.InsertPlayerlootQuery(comboMaulgarPlayer4.SelectedValue, comboMaulgarLoot4.SelectedValue, radioMaulgar4.SelectedValue, dateOfRaid, checkboxMaulgar4.Checked);

            Utility.InsertPlayerlootQuery(comboGruulPlayer1.SelectedValue, comboGruulLoot1.SelectedValue, radioGruul1.SelectedValue, dateOfRaid, checkboxGruul1.Checked);
            Utility.InsertPlayerlootQuery(comboGruulPlayer2.SelectedValue, comboGruulLoot2.SelectedValue, radioGruul2.SelectedValue, dateOfRaid, checkboxGruul2.Checked);
            Utility.InsertPlayerlootQuery(comboGruulPlayer3.SelectedValue, comboGruulLoot3.SelectedValue, radioGruul3.SelectedValue, dateOfRaid, checkboxGruul3.Checked);
            Utility.InsertPlayerlootQuery(comboGruulPlayer4.SelectedValue, comboGruulLoot4.SelectedValue, radioGruul4.SelectedValue, dateOfRaid, checkboxGruul4.Checked);



        }

        protected void calendarGruul_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarGruul, labelRaidsRun);
        }
    }
}