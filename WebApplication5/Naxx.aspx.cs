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
    public partial class Naxx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarNaxx.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarNaxx, labelRaidsRun);
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

                    List<string> tierNames = new List<string>{"Cenarion Belt",
                                                                "Cenarion Boots",
                                                                "Cenarion Bracers",
                                                                "Cenarion Vestments",
                                                                "Cenarion Gloves",
                                                                "Cenarion Helm",
                                                                "Cenarion Leggings",
                                                                "Cenarion Spaulders",
                                                                "Giantstalker's Belt",
                                                                "Giantstalker's Boots",
                                                                "Giantstalker's Bracers",
                                                                "Giantstalker's Breastplate",
                                                                "Giantstalker's Epaulets",
                                                                "Giantstalker's Gloves",
                                                                "Giantstalker's Helmet",
                                                                "Giantstalker's Leggings",
                                                                "Arcanist Belt",
                                                                "Arcanist Bindings",
                                                                "Arcanist Crown",
                                                                "Arcanist Boots",
                                                                "Arcanist Gloves",
                                                                "Arcanist Leggings",
                                                                "Arcanist Mantle",
                                                                "Arcanist Robes",
                                                                "Lawbringer Belt",
                                                                "Lawbringer Boots",
                                                                "Lawbringer Bracers",
                                                                "Lawbringer Chestguard",
                                                                "Lawbringer Gauntlets",
                                                                "Lawbringer Helm",
                                                                "Lawbringer Legplates",
                                                                "Lawbringer Spaulders",
                                                                "Boots of Prophecy",
                                                                "Circlet of Prophecy",
                                                                "Girdle of Prophecy",
                                                                "Gloves of Prophecy",
                                                                "Pants of Prophecy",
                                                                "Mantle of Prophecy",
                                                                "Robes of Prophecy",
                                                                "Vambraces of Prophecy",
                                                                "Nightslayer Belt",
                                                                "Nightslayer Boots",
                                                                "Nightslayer Bracelets",
                                                                "Nightslayer Chestpiece",
                                                                "Nightslayer Cover",
                                                                "Nightslayer Gloves",
                                                                "Nightslayer Pants",
                                                                "Nightslayer Shoulder Pads",
                                                                "Felheart Belt",
                                                                "Felheart Bracers",
                                                                "Felheart Gloves",
                                                                "Felheart Pants",
                                                                "Felheart Robes",
                                                                "Felheart Shoulder Pads",
                                                                "Felheart Horns",
                                                                "Felheart Slippers",
                                                                "Belt of Might",
                                                                "Bracers of Might",
                                                                "Breastplate of Might",
                                                                "Gauntlets of Might",
                                                                "Helm of Might",
                                                                "Legplates of Might",
                                                                "Pauldrons of Might",
                                                                "Sabatons of Might",
                                                                "Stormrage Belt",
                                                                "Stormrage Boots",
                                                                "Stormrage Bracers",
                                                                "Stormrage Chestguard",
                                                                "Stormrage Cover",
                                                                "Stormrage Handguards",
                                                                "Stormrage Legguards",
                                                                "Stormrage Pauldrons",
                                                                "Dragonstalker's Belt",
                                                                "Dragonstalker's Bracers",
                                                                "Dragonstalker's Breastplate",
                                                                "Dragonstalker's Gauntlets",
                                                                "Dragonstalker's Greaves",
                                                                "Dragonstalker's Helm",
                                                                "Dragonstalker's Legguards",
                                                                "Dragonstalker's Spaulders",
                                                                "Netherwind Belt",
                                                                "Netherwind Bindings",
                                                                "Netherwind Boots",
                                                                "Netherwind Crown",
                                                                "Netherwind Mantle",
                                                                "Netherwind Gloves",
                                                                "Netherwind Pants",
                                                                "Netherwind Robes",
                                                                "Judgement Belt",
                                                                "Judgement Bindings",
                                                                "Judgement Breastplate",
                                                                "Judgement Crown",
                                                                "Judgement Gauntlets",
                                                                "Judgement Legplates",
                                                                "Judgement Sabatons",
                                                                "Judgement Spaulders",
                                                                "Belt of Transcendence",
                                                                "Bindings of Transcendence",
                                                                "Boots of Transcendence",
                                                                "Halo of Transcendence",
                                                                "Handguards of Transcendence",
                                                                "Leggings of Transcendence",
                                                                "Pauldrons of Transcendence",
                                                                "Robes of Transcendence",
                                                                "Bloodfang Belt",
                                                                "Bloodfang Boots",
                                                                "Bloodfang Bracers",
                                                                "Bloodfang Chestpiece",
                                                                "Bloodfang Gloves",
                                                                "Bloodfang Hood",
                                                                "Bloodfang Pants",
                                                                "Bloodfang Spaulders",
                                                                "Nemesis Belt",
                                                                "Nemesis Boots",
                                                                "Nemesis Bracers",
                                                                "Nemesis Gloves",
                                                                "Nemesis Leggings",
                                                                "Nemesis Robes",
                                                                "Nemesis Skullcap",
                                                                "Nemesis Spaulders",
                                                                "Bracelets of Wrath",
                                                                "Breastplate of Wrath",
                                                                "Gauntlets of Wrath",
                                                                "Helm of Wrath",
                                                                "Legplates of Wrath",
                                                                "Pauldrons of Wrath",
                                                                "Sabatons of Wrath",
                                                                "Waistband of Wrath"
                                        };
                    List<string> tier1 = new List<string> {"Cenarion",
                                                            "Giantstalker",
                                                            "Arcanist",
                                                            "Lawbringer",
                                                            "Prophecy",
                                                            "Nightslayer",
                                                            "Felheart" ,
                                                            "Might"};
                    List<string> tier2 = new List<string> {"Stormrage",
                                                            "Dragonstalker",
                                                            "Netherwind",
                                                            "Judgement",
                                                            "Transcendence",
                                                            "Bloodfang",
                                                            "Nemesis" ,
                                                            "Wrath"};

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

                        string tierNumber = string.Empty;

                        if (tierNames.Contains(itemName))
                        {
                            string sqlSlot = string.Empty;
                            if (equipLoc.Equals("Chest")) sqlSlot = "Chest";
                            if (equipLoc.Equals("Head")) sqlSlot = "Helm";
                            if (equipLoc.Equals("Shoulder")) sqlSlot = "Shoulders";
                            if (equipLoc.Equals("Wrist")) sqlSlot = "Bracers";
                            if (equipLoc.Equals("Hands")) sqlSlot = "Gloves";
                            if (equipLoc.Equals("Feet")) sqlSlot = "Boots";
                            if (equipLoc.Equals("Legs")) sqlSlot = "Legs";
                            if (equipLoc.Equals("Waist")) sqlSlot = "Belt";

                            if (itemName.Contains("Cenarion") ||
                                itemName.Contains("Giantstalker") ||
                                itemName.Contains("Arcanist") ||
                                itemName.Contains("Lawbringer") ||
                                itemName.Contains("Prophecy") ||
                                itemName.Contains("Nightslayer") ||
                                itemName.Contains("Felheart") ||
                                itemName.Contains("Might"))
                            {
                                tierNumber = "T1";
                            }

                            if (itemName.Contains("Stormrage") ||
                                itemName.Contains("Dragonstalker") ||
                                itemName.Contains("Netherwind") ||
                                itemName.Contains("Judgement") ||
                                itemName.Contains("Transcendence") ||
                                itemName.Contains("Bloodfang") ||
                                itemName.Contains("Nemesis") ||
                                itemName.Contains("Wrath"))
                            {
                                tierNumber = "T2";
                            }
                            Utility.InsertPlayerlootQuery(playerName, tierNumber + sqlSlot, itemSpec, raidDate, sidegrade);
                        }
                        else
                        {
                            Utility.InsertPlayerlootQuery(playerName, itemName, itemSpec, raidDate, sidegrade);
                        }
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
            string dateOfRaid = calendarNaxx.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboAnubPlayer1.SelectedValue, comboAnubLoot1.SelectedValue, radioAnub1.SelectedValue, dateOfRaid, checkboxAnub1.Checked);
            Utility.InsertPlayerlootQuery(comboAnubPlayer2.SelectedValue, comboAnubLoot2.SelectedValue, radioAnub2.SelectedValue, dateOfRaid, checkboxAnub2.Checked);
            Utility.InsertPlayerlootQuery(comboAnubPlayer3.SelectedValue, comboAnubLoot3.SelectedValue, radioAnub3.SelectedValue, dateOfRaid, checkboxAnub3.Checked);

            Utility.InsertPlayerlootQuery(comboFaerlinaPlayer1.SelectedValue, comboFaerlinaLoot1.SelectedValue, radioFaerlina1.SelectedValue, dateOfRaid, checkboxFaerlina1.Checked);
            Utility.InsertPlayerlootQuery(comboFaerlinaPlayer2.SelectedValue, comboFaerlinaLoot2.SelectedValue, radioFaerlina2.SelectedValue, dateOfRaid, checkboxFaerlina2.Checked);
            Utility.InsertPlayerlootQuery(comboFaerlinaPlayer3.SelectedValue, comboFaerlinaLoot3.SelectedValue, radioFaerlina3.SelectedValue, dateOfRaid, checkboxFaerlina3.Checked);

            Utility.InsertPlayerlootQuery(comboMaexxnaPlayer1.SelectedValue, comboMaexxnaLoot1.SelectedValue, radioMaexxna1.SelectedValue, dateOfRaid, checkboxMaexxna1.Checked);
            Utility.InsertPlayerlootQuery(comboMaexxnaPlayer2.SelectedValue, comboMaexxnaLoot2.SelectedValue, radioMaexxna2.SelectedValue, dateOfRaid, checkboxMaexxna2.Checked);
            Utility.InsertPlayerlootQuery(comboMaexxnaPlayer3.SelectedValue, comboMaexxnaLoot3.SelectedValue, radioMaexxna3.SelectedValue, dateOfRaid, checkboxMaexxna3.Checked);
            Utility.InsertPlayerlootQuery(comboMaexxnaPlayer4.SelectedValue, comboMaexxnaLoot4.SelectedValue, radioMaexxna4.SelectedValue, dateOfRaid, checkboxMaexxna4.Checked);

            Utility.InsertPlayerlootQuery(comboNothPlayer1.SelectedValue, comboNothLoot1.SelectedValue, radioNoth1.SelectedValue, dateOfRaid, checkboxNoth1.Checked);
            Utility.InsertPlayerlootQuery(comboNothPlayer2.SelectedValue, comboNothLoot2.SelectedValue, radioNoth2.SelectedValue, dateOfRaid, checkboxNoth2.Checked);
            Utility.InsertPlayerlootQuery(comboNothPlayer3.SelectedValue, comboNothLoot3.SelectedValue, radioNoth3.SelectedValue, dateOfRaid, checkboxNoth3.Checked);

            Utility.InsertPlayerlootQuery(comboHeiganPlayer1.SelectedValue, comboHeiganLoot1.SelectedValue, radioHeigan1.SelectedValue, dateOfRaid, checkboxHeigan1.Checked);
            Utility.InsertPlayerlootQuery(comboHeiganPlayer2.SelectedValue, comboHeiganLoot2.SelectedValue, radioHeigan2.SelectedValue, dateOfRaid, checkboxHeigan2.Checked);
            Utility.InsertPlayerlootQuery(comboHeiganPlayer3.SelectedValue, comboHeiganLoot3.SelectedValue, radioHeigan3.SelectedValue, dateOfRaid, checkboxHeigan3.Checked);

            Utility.InsertPlayerlootQuery(comboLoathebPlayer1.SelectedValue, comboLoathebLoot1.SelectedValue, radioLoatheb1.SelectedValue, dateOfRaid, checkboxLoatheb1.Checked);
            Utility.InsertPlayerlootQuery(comboLoathebPlayer2.SelectedValue, comboLoathebLoot2.SelectedValue, radioLoatheb2.SelectedValue, dateOfRaid, checkboxLoatheb2.Checked);
            Utility.InsertPlayerlootQuery(comboLoathebPlayer3.SelectedValue, comboLoathebLoot3.SelectedValue, radioLoatheb3.SelectedValue, dateOfRaid, checkboxLoatheb3.Checked);
            Utility.InsertPlayerlootQuery(comboLoathebPlayer4.SelectedValue, comboLoathebLoot4.SelectedValue, radioLoatheb4.SelectedValue, dateOfRaid, checkboxLoatheb4.Checked);

            Utility.InsertPlayerlootQuery(comboPatchwerkPlayer1.SelectedValue, comboPatchwerkLoot1.SelectedValue, radioPatchwerk1.SelectedValue, dateOfRaid, checkboxPatchwerk1.Checked);
            Utility.InsertPlayerlootQuery(comboPatchwerkPlayer2.SelectedValue, comboPatchwerkLoot2.SelectedValue, radioPatchwerk2.SelectedValue, dateOfRaid, checkboxPatchwerk2.Checked);
            Utility.InsertPlayerlootQuery(comboPatchwerkPlayer3.SelectedValue, comboPatchwerkLoot3.SelectedValue, radioPatchwerk3.SelectedValue, dateOfRaid, checkboxPatchwerk3.Checked);

            Utility.InsertPlayerlootQuery(comboGrobbulusPlayer1.SelectedValue, comboGrobbulusLoot1.SelectedValue, radioGrobbulus1.SelectedValue, dateOfRaid, checkboxGrobbulus1.Checked);
            Utility.InsertPlayerlootQuery(comboGrobbulusPlayer2.SelectedValue, comboGrobbulusLoot2.SelectedValue, radioGrobbulus2.SelectedValue, dateOfRaid, checkboxGrobbulus2.Checked);
            Utility.InsertPlayerlootQuery(comboGrobbulusPlayer3.SelectedValue, comboGrobbulusLoot3.SelectedValue, radioGrobbulus3.SelectedValue, dateOfRaid, checkboxGrobbulus3.Checked);

            Utility.InsertPlayerlootQuery(comboGluthPlayer1.SelectedValue, comboGluthLoot1.SelectedValue, radioGluth1.SelectedValue, dateOfRaid, checkboxGluth1.Checked);
            Utility.InsertPlayerlootQuery(comboGluthPlayer2.SelectedValue, comboGluthLoot2.SelectedValue, radioGluth2.SelectedValue, dateOfRaid, checkboxGluth2.Checked);
            Utility.InsertPlayerlootQuery(comboGluthPlayer3.SelectedValue, comboGluthLoot3.SelectedValue, radioGluth3.SelectedValue, dateOfRaid, checkboxGluth3.Checked);

            Utility.InsertPlayerlootQuery(comboThaddiusPlayer1.SelectedValue, comboThaddiusLoot1.SelectedValue, radioThaddius1.SelectedValue, dateOfRaid, checkboxThaddius1.Checked);
            Utility.InsertPlayerlootQuery(comboThaddiusPlayer2.SelectedValue, comboThaddiusLoot2.SelectedValue, radioThaddius2.SelectedValue, dateOfRaid, checkboxThaddius2.Checked);
            Utility.InsertPlayerlootQuery(comboThaddiusPlayer3.SelectedValue, comboThaddiusLoot3.SelectedValue, radioThaddius3.SelectedValue, dateOfRaid, checkboxThaddius3.Checked);
            Utility.InsertPlayerlootQuery(comboThaddiusPlayer4.SelectedValue, comboThaddiusLoot4.SelectedValue, radioThaddius4.SelectedValue, dateOfRaid, checkboxThaddius4.Checked);

            Utility.InsertPlayerlootQuery(comboRazuviousPlayer1.SelectedValue, comboRazuviousLoot1.SelectedValue, radioRazuvious1.SelectedValue, dateOfRaid, checkboxRazuvious1.Checked);
            Utility.InsertPlayerlootQuery(comboRazuviousPlayer2.SelectedValue, comboRazuviousLoot2.SelectedValue, radioRazuvious2.SelectedValue, dateOfRaid, checkboxRazuvious2.Checked);
            Utility.InsertPlayerlootQuery(comboRazuviousPlayer3.SelectedValue, comboRazuviousLoot3.SelectedValue, radioRazuvious3.SelectedValue, dateOfRaid, checkboxRazuvious3.Checked);

            Utility.InsertPlayerlootQuery(comboGothikPlayer1.SelectedValue, comboGothikLoot1.SelectedValue, radioGothik1.SelectedValue, dateOfRaid, checkboxGothik1.Checked);
            Utility.InsertPlayerlootQuery(comboGothikPlayer2.SelectedValue, comboGothikLoot2.SelectedValue, radioGothik2.SelectedValue, dateOfRaid, checkboxGothik2.Checked);
            Utility.InsertPlayerlootQuery(comboGothikPlayer3.SelectedValue, comboGothikLoot3.SelectedValue, radioGothik3.SelectedValue, dateOfRaid, checkboxGothik3.Checked);

            Utility.InsertPlayerlootQuery(comboHorsePlayer1.SelectedValue, comboHorseLoot1.SelectedValue, radioHorse1.SelectedValue, dateOfRaid, checkboxHorse1.Checked);
            Utility.InsertPlayerlootQuery(comboHorsePlayer2.SelectedValue, comboHorseLoot2.SelectedValue, radioHorse2.SelectedValue, dateOfRaid, checkboxHorse2.Checked);
            Utility.InsertPlayerlootQuery(comboHorsePlayer3.SelectedValue, comboHorseLoot3.SelectedValue, radioHorse3.SelectedValue, dateOfRaid, checkboxHorse3.Checked);
            Utility.InsertPlayerlootQuery(comboHorsePlayer4.SelectedValue, comboHorseLoot4.SelectedValue, radioHorse4.SelectedValue, dateOfRaid, checkboxHorse4.Checked);

            Utility.InsertPlayerlootQuery(comboSapphironPlayer1.SelectedValue, comboSapphironLoot1.SelectedValue, radioSapphiron1.SelectedValue, dateOfRaid, checkboxSapphiron1.Checked);
            Utility.InsertPlayerlootQuery(comboSapphironPlayer2.SelectedValue, comboSapphironLoot2.SelectedValue, radioSapphiron2.SelectedValue, dateOfRaid, checkboxSapphiron2.Checked);
            Utility.InsertPlayerlootQuery(comboSapphironPlayer3.SelectedValue, comboSapphironLoot3.SelectedValue, radioSapphiron3.SelectedValue, dateOfRaid, checkboxSapphiron3.Checked);
            Utility.InsertPlayerlootQuery(comboSapphironPlayer4.SelectedValue, comboSapphironLoot4.SelectedValue, radioSapphiron4.SelectedValue, dateOfRaid, checkboxSapphiron4.Checked);
            Utility.InsertPlayerlootQuery(comboSapphironPlayer5.SelectedValue, comboSapphironLoot5.SelectedValue, radioSapphiron5.SelectedValue, dateOfRaid, checkboxSapphiron5.Checked);

            Utility.InsertPlayerlootQuery(comboKelThuzadPlayer1.SelectedValue, comboKelThuzadLoot1.SelectedValue, radioKelThuzad1.SelectedValue, dateOfRaid, checkboxKelThuzad1.Checked);
            Utility.InsertPlayerlootQuery(comboKelThuzadPlayer2.SelectedValue, comboKelThuzadLoot2.SelectedValue, radioKelThuzad2.SelectedValue, dateOfRaid, checkboxKelThuzad2.Checked);
            Utility.InsertPlayerlootQuery(comboKelThuzadPlayer3.SelectedValue, comboKelThuzadLoot3.SelectedValue, radioKelThuzad3.SelectedValue, dateOfRaid, checkboxKelThuzad3.Checked);
            Utility.InsertPlayerlootQuery(comboKelThuzadPlayer4.SelectedValue, comboKelThuzadLoot4.SelectedValue, radioKelThuzad4.SelectedValue, dateOfRaid, checkboxKelThuzad4.Checked);
            Utility.InsertPlayerlootQuery(comboKelThuzadPlayer5.SelectedValue, comboKelThuzadLoot5.SelectedValue, radioKelThuzad5.SelectedValue, dateOfRaid, checkboxKelThuzad5.Checked);

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

        protected void calendarNaxx_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarNaxx, labelRaidsRun);
        }
    }
}