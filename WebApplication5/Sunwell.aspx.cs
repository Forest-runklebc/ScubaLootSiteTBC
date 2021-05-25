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
    public partial class Sunwell : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarSunwell.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarSunwell, labelRaidsRun);
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
            string dateOfRaid = calendarSunwell.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboKalecgosPlayer1.SelectedValue, comboKalecgosLoot1.SelectedValue, radioKalecgos1.SelectedValue, dateOfRaid, checkboxKalecgos1.Checked);
            Utility.InsertPlayerlootQuery(comboKalecgosPlayer2.SelectedValue, comboKalecgosLoot2.SelectedValue, radioKalecgos2.SelectedValue, dateOfRaid, checkboxKalecgos2.Checked);

            Utility.InsertPlayerlootQuery(comboBrutallusPlayer1.SelectedValue, comboBrutallusLoot1.SelectedValue, radioBrutallus1.SelectedValue, dateOfRaid, checkboxBrutallus1.Checked);
            Utility.InsertPlayerlootQuery(comboBrutallusPlayer2.SelectedValue, comboBrutallusLoot2.SelectedValue, radioBrutallus2.SelectedValue, dateOfRaid, checkboxBrutallus2.Checked);
            Utility.InsertPlayerlootQuery(comboBrutallusPlayer3.SelectedValue, comboBrutallusLoot3.SelectedValue, radioBrutallus3.SelectedValue, dateOfRaid, checkboxBrutallus3.Checked);

            Utility.InsertPlayerlootQuery(comboFelmystPlayer1.SelectedValue, comboFelmystLoot1.SelectedValue, radioFelmyst1.SelectedValue, dateOfRaid, checkboxFelmyst1.Checked);
            Utility.InsertPlayerlootQuery(comboFelmystPlayer2.SelectedValue, comboFelmystLoot2.SelectedValue, radioFelmyst2.SelectedValue, dateOfRaid, checkboxFelmyst2.Checked);

            Utility.InsertPlayerlootQuery(comboTwinsPlayer1.SelectedValue, comboTwinsLoot1.SelectedValue, radioTwins1.SelectedValue, dateOfRaid, checkboxTwins1.Checked);
            Utility.InsertPlayerlootQuery(comboTwinsPlayer2.SelectedValue, comboTwinsLoot2.SelectedValue, radioTwins2.SelectedValue, dateOfRaid, checkboxTwins2.Checked);
            Utility.InsertPlayerlootQuery(comboTwinsPlayer3.SelectedValue, comboTwinsLoot3.SelectedValue, radioTwins3.SelectedValue, dateOfRaid, checkboxTwins3.Checked);
            Utility.InsertPlayerlootQuery(comboTwinsPlayer4.SelectedValue, comboTwinsLoot4.SelectedValue, radioTwins4.SelectedValue, dateOfRaid, checkboxTwins4.Checked);

            Utility.InsertPlayerlootQuery(comboMuruPlayer1.SelectedValue, comboMuruLoot1.SelectedValue, radioMuru1.SelectedValue, dateOfRaid, checkboxMuru1.Checked);
            Utility.InsertPlayerlootQuery(comboMuruPlayer2.SelectedValue, comboMuruLoot2.SelectedValue, radioMuru2.SelectedValue, dateOfRaid, checkboxMuru2.Checked);
            Utility.InsertPlayerlootQuery(comboMuruPlayer3.SelectedValue, comboMuruLoot3.SelectedValue, radioMuru3.SelectedValue, dateOfRaid, checkboxMuru3.Checked);

            Utility.InsertPlayerlootQuery(comboKiljaedenPlayer1.SelectedValue, comboKiljaedenLoot1.SelectedValue, radioKiljaeden1.SelectedValue, dateOfRaid, checkboxKiljaeden1.Checked);
            Utility.InsertPlayerlootQuery(comboKiljaedenPlayer2.SelectedValue, comboKiljaedenLoot2.SelectedValue, radioKiljaeden2.SelectedValue, dateOfRaid, checkboxKiljaeden2.Checked);

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

        }

        protected void calendarSunwell_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarSunwell, labelRaidsRun);
        }
    }
}