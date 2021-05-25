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
    public partial class SSC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarSSC.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarSSC, labelRaidsRun);
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
            string dateOfRaid = calendarSSC.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboHydrosPlayer1.SelectedValue, comboHydrosLoot1.SelectedValue, radioHydros1.SelectedValue, dateOfRaid, checkboxHydros1.Checked);
            Utility.InsertPlayerlootQuery(comboHydrosPlayer2.SelectedValue, comboHydrosLoot2.SelectedValue, radioHydros2.SelectedValue, dateOfRaid, checkboxHydros2.Checked);
            Utility.InsertPlayerlootQuery(comboHydrosPlayer3.SelectedValue, comboHydrosLoot3.SelectedValue, radioHydros3.SelectedValue, dateOfRaid, checkboxHydros3.Checked);

            Utility.InsertPlayerlootQuery(comboLurkerPlayer1.SelectedValue, comboLurkerLoot1.SelectedValue, radioLurker1.SelectedValue, dateOfRaid, checkboxLurker1.Checked);
            Utility.InsertPlayerlootQuery(comboLurkerPlayer2.SelectedValue, comboLurkerLoot2.SelectedValue, radioLurker2.SelectedValue, dateOfRaid, checkboxLurker2.Checked);
            Utility.InsertPlayerlootQuery(comboLurkerPlayer3.SelectedValue, comboLurkerLoot3.SelectedValue, radioLurker3.SelectedValue, dateOfRaid, checkboxLurker3.Checked);

            Utility.InsertPlayerlootQuery(comboLeotherasPlayer1.SelectedValue, comboLeotherasLoot1.SelectedValue, radioLeotheras1.SelectedValue, dateOfRaid, checkboxLeotheras1.Checked);
            Utility.InsertPlayerlootQuery(comboLeotherasPlayer2.SelectedValue, comboLeotherasLoot2.SelectedValue, radioLeotheras2.SelectedValue, dateOfRaid, checkboxLeotheras2.Checked);
            Utility.InsertPlayerlootQuery(comboLeotherasPlayer3.SelectedValue, comboLeotherasLoot3.SelectedValue, radioLeotheras3.SelectedValue, dateOfRaid, checkboxLeotheras3.Checked);

            Utility.InsertPlayerlootQuery(comboKarathressPlayer1.SelectedValue, comboKarathressLoot1.SelectedValue, radioKarathress1.SelectedValue, dateOfRaid, checkboxKarathress1.Checked);
            Utility.InsertPlayerlootQuery(comboKarathressPlayer2.SelectedValue, comboKarathressLoot2.SelectedValue, radioKarathress2.SelectedValue, dateOfRaid, checkboxKarathress2.Checked);
            Utility.InsertPlayerlootQuery(comboKarathressPlayer3.SelectedValue, comboKarathressLoot3.SelectedValue, radioKarathress3.SelectedValue, dateOfRaid, checkboxKarathress3.Checked);

            Utility.InsertPlayerlootQuery(comboTidewalkerPlayer1.SelectedValue, comboTidewalkerLoot1.SelectedValue, radioTidewalker1.SelectedValue, dateOfRaid, checkboxTidewalker1.Checked);
            Utility.InsertPlayerlootQuery(comboTidewalkerPlayer2.SelectedValue, comboTidewalkerLoot2.SelectedValue, radioTidewalker2.SelectedValue, dateOfRaid, checkboxTidewalker2.Checked);
            Utility.InsertPlayerlootQuery(comboTidewalkerPlayer3.SelectedValue, comboTidewalkerLoot3.SelectedValue, radioTidewalker3.SelectedValue, dateOfRaid, checkboxTidewalker3.Checked);
            Utility.InsertPlayerlootQuery(comboTidewalkerPlayer4.SelectedValue, comboTidewalkerLoot4.SelectedValue, radioTidewalker4.SelectedValue, dateOfRaid, checkboxTidewalker4.Checked);

            Utility.InsertPlayerlootQuery(comboVashjPlayer1.SelectedValue, comboVashjLoot1.SelectedValue, radioVashj1.SelectedValue, dateOfRaid, checkboxVashj1.Checked);
            Utility.InsertPlayerlootQuery(comboVashjPlayer2.SelectedValue, comboVashjLoot2.SelectedValue, radioVashj2.SelectedValue, dateOfRaid, checkboxVashj2.Checked);
            Utility.InsertPlayerlootQuery(comboVashjPlayer3.SelectedValue, comboVashjLoot3.SelectedValue, radioVashj3.SelectedValue, dateOfRaid, checkboxVashj3.Checked);
            Utility.InsertPlayerlootQuery(comboVashjPlayer4.SelectedValue, comboVashjLoot4.SelectedValue, radioVashj4.SelectedValue, dateOfRaid, checkboxVashj4.Checked);

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

        protected void calendarSSC_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarSSC, labelRaidsRun);
        }
    }
}