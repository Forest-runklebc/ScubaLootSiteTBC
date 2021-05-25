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
    public partial class BlackTemple : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarBlackTemple.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarBlackTemple, labelRaidsRun);
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

                        string tierNumber = string.Empty;


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
            string dateOfRaid = calendarBlackTemple.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboNajentusPlayer1.SelectedValue, comboNajentusLoot1.SelectedValue, radioNajentus1.SelectedValue, dateOfRaid, checkboxNajentus1.Checked);
            Utility.InsertPlayerlootQuery(comboNajentusPlayer2.SelectedValue, comboNajentusLoot2.SelectedValue, radioNajentus2.SelectedValue, dateOfRaid, checkboxNajentus2.Checked);

            Utility.InsertPlayerlootQuery(comboSupremusPlayer1.SelectedValue, comboSupremusLoot1.SelectedValue, radioSupremus1.SelectedValue, dateOfRaid, checkboxSupremus1.Checked);
            Utility.InsertPlayerlootQuery(comboSupremusPlayer2.SelectedValue, comboSupremusLoot2.SelectedValue, radioSupremus2.SelectedValue, dateOfRaid, checkboxSupremus2.Checked);
            Utility.InsertPlayerlootQuery(comboSupremusPlayer3.SelectedValue, comboSupremusLoot3.SelectedValue, radioSupremus3.SelectedValue, dateOfRaid, checkboxSupremus3.Checked);

            Utility.InsertPlayerlootQuery(comboShadePlayer1.SelectedValue, comboShadeLoot1.SelectedValue, radioShade1.SelectedValue, dateOfRaid, checkboxShade1.Checked);
            Utility.InsertPlayerlootQuery(comboShadePlayer2.SelectedValue, comboShadeLoot2.SelectedValue, radioShade2.SelectedValue, dateOfRaid, checkboxShade2.Checked);

            Utility.InsertPlayerlootQuery(comboGorefiendPlayer1.SelectedValue, comboGorefiendLoot1.SelectedValue, radioGorefiend1.SelectedValue, dateOfRaid, checkboxGorefiend1.Checked);
            Utility.InsertPlayerlootQuery(comboGorefiendPlayer2.SelectedValue, comboGorefiendLoot2.SelectedValue, radioGorefiend2.SelectedValue, dateOfRaid, checkboxGorefiend2.Checked);
            Utility.InsertPlayerlootQuery(comboGorefiendPlayer3.SelectedValue, comboGorefiendLoot3.SelectedValue, radioGorefiend3.SelectedValue, dateOfRaid, checkboxGorefiend3.Checked);
            Utility.InsertPlayerlootQuery(comboGorefiendPlayer4.SelectedValue, comboGorefiendLoot4.SelectedValue, radioGorefiend4.SelectedValue, dateOfRaid, checkboxGorefiend4.Checked);

            Utility.InsertPlayerlootQuery(comboReliquaryPlayer1.SelectedValue, comboReliquaryLoot1.SelectedValue, radioReliquary1.SelectedValue, dateOfRaid, checkboxReliquary1.Checked);
            Utility.InsertPlayerlootQuery(comboReliquaryPlayer2.SelectedValue, comboReliquaryLoot2.SelectedValue, radioReliquary2.SelectedValue, dateOfRaid, checkboxReliquary2.Checked);
            

            Utility.InsertPlayerlootQuery(comboShahrazPlayer1.SelectedValue, comboShahrazLoot1.SelectedValue, radioShahraz1.SelectedValue, dateOfRaid, checkboxShahraz1.Checked);
            Utility.InsertPlayerlootQuery(comboShahrazPlayer2.SelectedValue, comboShahrazLoot2.SelectedValue, radioShahraz2.SelectedValue, dateOfRaid, checkboxShahraz2.Checked);

            Utility.InsertPlayerlootQuery(comboCouncilPlayer1.SelectedValue, comboCouncilLoot1.SelectedValue, radioCouncil1.SelectedValue, dateOfRaid, checkboxCouncil1.Checked);
            Utility.InsertPlayerlootQuery(comboCouncilPlayer2.SelectedValue, comboCouncilLoot2.SelectedValue, radioCouncil2.SelectedValue, dateOfRaid, checkboxCouncil2.Checked);

            Utility.InsertPlayerlootQuery(comboIllidanPlayer1.SelectedValue, comboIllidanLoot1.SelectedValue, radioIllidan1.SelectedValue, dateOfRaid, checkboxIllidan1.Checked);
            Utility.InsertPlayerlootQuery(comboIllidanPlayer2.SelectedValue, comboIllidanLoot2.SelectedValue, radioIllidan2.SelectedValue, dateOfRaid, checkboxIllidan2.Checked);
            Utility.InsertPlayerlootQuery(comboIllidanPlayer3.SelectedValue, comboIllidanLoot3.SelectedValue, radioIllidan3.SelectedValue, dateOfRaid, checkboxIllidan3.Checked);

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

        protected void calendarBlackTemple_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarBlackTemple, labelRaidsRun);
        }
    }
}