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
    public partial class Hyjal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarHyjal.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarHyjal, labelRaidsRun);
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
            string dateOfRaid = calendarHyjal.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboWinterchillPlayer1.SelectedValue, comboWinterchillLoot1.SelectedValue, radioWinterchill1.SelectedValue, dateOfRaid, checkboxWinterchill1.Checked);
            Utility.InsertPlayerlootQuery(comboWinterchillPlayer2.SelectedValue, comboWinterchillLoot2.SelectedValue, radioWinterchill2.SelectedValue, dateOfRaid, checkboxWinterchill2.Checked);
            Utility.InsertPlayerlootQuery(comboWinterchillPlayer3.SelectedValue, comboWinterchillLoot3.SelectedValue, radioWinterchill3.SelectedValue, dateOfRaid, checkboxWinterchill3.Checked);

            Utility.InsertPlayerlootQuery(comboAnetheronPlayer1.SelectedValue, comboAnetheronLoot1.SelectedValue, radioAnetheron1.SelectedValue, dateOfRaid, checkboxAnetheron1.Checked);
            Utility.InsertPlayerlootQuery(comboAnetheronPlayer2.SelectedValue, comboAnetheronLoot2.SelectedValue, radioAnetheron2.SelectedValue, dateOfRaid, checkboxAnetheron2.Checked);
            Utility.InsertPlayerlootQuery(comboAnetheronPlayer3.SelectedValue, comboAnetheronLoot3.SelectedValue, radioAnetheron3.SelectedValue, dateOfRaid, checkboxAnetheron3.Checked);

            Utility.InsertPlayerlootQuery(comboKazrogalPlayer1.SelectedValue, comboKazrogalLoot1.SelectedValue, radioKazrogal1.SelectedValue, dateOfRaid, checkboxKazrogal1.Checked);
            Utility.InsertPlayerlootQuery(comboKazrogalPlayer2.SelectedValue, comboKazrogalLoot2.SelectedValue, radioKazrogal2.SelectedValue, dateOfRaid, checkboxKazrogal2.Checked);
            Utility.InsertPlayerlootQuery(comboKazrogalPlayer3.SelectedValue, comboKazrogalLoot3.SelectedValue, radioKazrogal3.SelectedValue, dateOfRaid, checkboxKazrogal3.Checked);

            Utility.InsertPlayerlootQuery(comboAzgalorPlayer1.SelectedValue, comboAzgalorLoot1.SelectedValue, radioAzgalor1.SelectedValue, dateOfRaid, checkboxAzgalor1.Checked);
            Utility.InsertPlayerlootQuery(comboAzgalorPlayer2.SelectedValue, comboAzgalorLoot2.SelectedValue, radioAzgalor2.SelectedValue, dateOfRaid, checkboxAzgalor2.Checked);
            Utility.InsertPlayerlootQuery(comboAzgalorPlayer3.SelectedValue, comboAzgalorLoot3.SelectedValue, radioAzgalor3.SelectedValue, dateOfRaid, checkboxAzgalor3.Checked);

            Utility.InsertPlayerlootQuery(comboArchimondePlayer1.SelectedValue, comboArchimondeLoot1.SelectedValue, radioArchimonde1.SelectedValue, dateOfRaid, checkboxArchimonde1.Checked);
            Utility.InsertPlayerlootQuery(comboArchimondePlayer2.SelectedValue, comboArchimondeLoot2.SelectedValue, radioArchimonde2.SelectedValue, dateOfRaid, checkboxArchimonde2.Checked);
            Utility.InsertPlayerlootQuery(comboArchimondePlayer3.SelectedValue, comboArchimondeLoot3.SelectedValue, radioArchimonde3.SelectedValue, dateOfRaid, checkboxArchimonde3.Checked);
            Utility.InsertPlayerlootQuery(comboArchimondePlayer4.SelectedValue, comboArchimondeLoot4.SelectedValue, radioArchimonde4.SelectedValue, dateOfRaid, checkboxArchimonde4.Checked);

            Utility.InsertPlayerlootQuery(comboTrashPlayer1.SelectedValue, comboTrashLoot1.SelectedValue, radioTrash1.SelectedValue, dateOfRaid, checkboxTrash1.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer2.SelectedValue, comboTrashLoot2.SelectedValue, radioTrash2.SelectedValue, dateOfRaid, checkboxTrash2.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer3.SelectedValue, comboTrashLoot3.SelectedValue, radioTrash3.SelectedValue, dateOfRaid, checkboxTrash3.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer4.SelectedValue, comboTrashLoot4.SelectedValue, radioTrash4.SelectedValue, dateOfRaid, checkboxTrash4.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer5.SelectedValue, comboTrashLoot5.SelectedValue, radioTrash5.SelectedValue, dateOfRaid, checkboxTrash5.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer6.SelectedValue, comboTrashLoot6.SelectedValue, radioTrash6.SelectedValue, dateOfRaid, checkboxTrash6.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer7.SelectedValue, comboTrashLoot7.SelectedValue, radioTrash7.SelectedValue, dateOfRaid, checkboxTrash7.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer8.SelectedValue, comboTrashLoot8.SelectedValue, radioTrash8.SelectedValue, dateOfRaid, checkboxTrash8.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer9.SelectedValue, comboTrashLoot9.SelectedValue, radioTrash9.SelectedValue, dateOfRaid, checkboxTrash9.Checked);
            Utility.InsertPlayerlootQuery(comboTrashPlayer10.SelectedValue, comboTrashLoot10.SelectedValue, radioTrash10.SelectedValue, dateOfRaid, checkboxTrash10.Checked);

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void calendarHyjal_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarHyjal, labelRaidsRun);
        }
    }
}