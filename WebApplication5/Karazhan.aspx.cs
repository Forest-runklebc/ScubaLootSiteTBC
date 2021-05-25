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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarKara.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarKara, labelRaidsRun);
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
            string dateOfRaid = calendarKara.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboAttumenPlayer1.SelectedValue, comboAttumenLoot1.SelectedValue, radioAttumen1.SelectedValue, dateOfRaid, checkboxAttumen1.Checked);
            Utility.InsertPlayerlootQuery(comboAttumenPlayer2.SelectedValue, comboAttumenLoot2.SelectedValue, radioAttumen2.SelectedValue, dateOfRaid, checkboxAttumen2.Checked);

            Utility.InsertPlayerlootQuery(comboMoroesPlayer1.SelectedValue, comboMoroesLoot1.SelectedValue, radioMoroes1.SelectedValue, dateOfRaid, checkboxMoroes1.Checked);
            Utility.InsertPlayerlootQuery(comboMoroesPlayer2.SelectedValue, comboMoroesLoot2.SelectedValue, radioMoroes2.SelectedValue, dateOfRaid, checkboxMoroes2.Checked);
            Utility.InsertPlayerlootQuery(comboMoroesPlayer3.SelectedValue, comboMoroesLoot3.SelectedValue, radioMoroes3.SelectedValue, dateOfRaid, checkboxMoroes3.Checked);

            Utility.InsertPlayerlootQuery(comboMaidenPlayer1.SelectedValue, comboMaidenLoot1.SelectedValue, radioMaiden1.SelectedValue, dateOfRaid, checkboxMaiden1.Checked);
            Utility.InsertPlayerlootQuery(comboMaidenPlayer2.SelectedValue, comboMaidenLoot2.SelectedValue, radioMaiden2.SelectedValue, dateOfRaid, checkboxMaiden2.Checked);

            Utility.InsertPlayerlootQuery(comboOperaPlayer1.SelectedValue, comboOperaLoot1.SelectedValue, radioOpera1.SelectedValue, dateOfRaid, checkboxOpera1.Checked);
            Utility.InsertPlayerlootQuery(comboOperaPlayer2.SelectedValue, comboOperaLoot2.SelectedValue, radioOpera2.SelectedValue, dateOfRaid, checkboxOpera2.Checked);
            Utility.InsertPlayerlootQuery(comboOperaPlayer3.SelectedValue, comboOperaLoot3.SelectedValue, radioOpera3.SelectedValue, dateOfRaid, checkboxOpera3.Checked);
            Utility.InsertPlayerlootQuery(comboOperaPlayer4.SelectedValue, comboOperaLoot4.SelectedValue, radioOpera4.SelectedValue, dateOfRaid, checkboxOpera4.Checked);

            Utility.InsertPlayerlootQuery(comboCuratorPlayer1.SelectedValue, comboCuratorLoot1.SelectedValue, radioCurator1.SelectedValue, dateOfRaid, checkboxCurator1.Checked);
            Utility.InsertPlayerlootQuery(comboCuratorPlayer2.SelectedValue, comboCuratorLoot2.SelectedValue, radioCurator2.SelectedValue, dateOfRaid, checkboxCurator2.Checked);
            Utility.InsertPlayerlootQuery(comboCuratorPlayer3.SelectedValue, comboCuratorLoot3.SelectedValue, radioCurator3.SelectedValue, dateOfRaid, checkboxCurator3.Checked);

            Utility.InsertPlayerlootQuery(comboIllhoofPlayer1.SelectedValue, comboIllhoofLoot1.SelectedValue, radioIllhoof1.SelectedValue, dateOfRaid, checkboxIllhoof1.Checked);
            Utility.InsertPlayerlootQuery(comboIllhoofPlayer2.SelectedValue, comboIllhoofLoot2.SelectedValue, radioIllhoof2.SelectedValue, dateOfRaid, checkboxIllhoof2.Checked);

            Utility.InsertPlayerlootQuery(comboAranPlayer1.SelectedValue, comboAranLoot1.SelectedValue, radioAran1.SelectedValue, dateOfRaid, checkboxAran1.Checked);
            Utility.InsertPlayerlootQuery(comboAranPlayer2.SelectedValue, comboAranLoot2.SelectedValue, radioAran2.SelectedValue, dateOfRaid, checkboxAran2.Checked);

            Utility.InsertPlayerlootQuery(comboNetherspitePlayer1.SelectedValue, comboNetherspiteLoot1.SelectedValue, radioNetherspite1.SelectedValue, dateOfRaid, checkboxNetherspite1.Checked);
            Utility.InsertPlayerlootQuery(comboNetherspitePlayer2.SelectedValue, comboNetherspiteLoot2.SelectedValue, radioNetherspite2.SelectedValue, dateOfRaid, checkboxNetherspite2.Checked);
            Utility.InsertPlayerlootQuery(comboNetherspitePlayer3.SelectedValue, comboNetherspiteLoot3.SelectedValue, radioNetherspite3.SelectedValue, dateOfRaid, checkboxNetherspite3.Checked);

            Utility.InsertPlayerlootQuery(comboChessPlayer1.SelectedValue, comboChessLoot1.SelectedValue, radioChess1.SelectedValue, dateOfRaid, checkboxChess1.Checked);
            Utility.InsertPlayerlootQuery(comboChessPlayer2.SelectedValue, comboChessLoot2.SelectedValue, radioChess2.SelectedValue, dateOfRaid, checkboxChess2.Checked);
            Utility.InsertPlayerlootQuery(comboChessPlayer3.SelectedValue, comboChessLoot3.SelectedValue, radioChess3.SelectedValue, dateOfRaid, checkboxChess3.Checked);

            Utility.InsertPlayerlootQuery(comboNightbanePlayer1.SelectedValue, comboNightbaneLoot1.SelectedValue, radioNightbane1.SelectedValue, dateOfRaid, checkboxNightbane1.Checked);
            Utility.InsertPlayerlootQuery(comboNightbanePlayer2.SelectedValue, comboNightbaneLoot2.SelectedValue, radioNightbane2.SelectedValue, dateOfRaid, checkboxNightbane2.Checked);
            Utility.InsertPlayerlootQuery(comboNightbanePlayer3.SelectedValue, comboNightbaneLoot3.SelectedValue, radioNightbane3.SelectedValue, dateOfRaid, checkboxNightbane3.Checked);
            Utility.InsertPlayerlootQuery(comboNightbanePlayer4.SelectedValue, comboNightbaneLoot4.SelectedValue, radioNightbane4.SelectedValue, dateOfRaid, checkboxNightbane4.Checked);

            Utility.InsertPlayerlootQuery(comboPrincePlayer1.SelectedValue, comboPrinceLoot1.SelectedValue, radioPrince1.SelectedValue, dateOfRaid, checkboxPrince1.Checked);
            Utility.InsertPlayerlootQuery(comboPrincePlayer2.SelectedValue, comboPrinceLoot2.SelectedValue, radioPrince2.SelectedValue, dateOfRaid, checkboxPrince2.Checked);
            Utility.InsertPlayerlootQuery(comboPrincePlayer3.SelectedValue, comboPrinceLoot3.SelectedValue, radioPrince3.SelectedValue, dateOfRaid, checkboxPrince3.Checked);
            Utility.InsertPlayerlootQuery(comboPrincePlayer4.SelectedValue, comboPrinceLoot4.SelectedValue, radioPrince4.SelectedValue, dateOfRaid, checkboxPrince4.Checked);


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

        protected void calendarKara_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarKara, labelRaidsRun);
        }
    }
}