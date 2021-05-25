using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Globalization;

/*  Class Color Hex Codes
Attendance Good color = #b7e1cd
Attendance Bad color = #f4c7c3

Tank header color = #cc4125
DPS Warrior header color = #cc4125
Warrior table color = #e6b8af

Rogue header color = #ffff00
Rogue table color = #ffe599

Hunter header color = #6aa84f
Hunter table color = #b6d7a8

Druid header color = #ff9900
Druid table color = #f9cb9c

Paladin header color = #ff00ff
Paladin table color = #d5a6bd

Priest header color = #000000
Priest table color = #cccccc

Shaman header color = #0070DD
Shaman table color = #00c0dd

Mage header color = #4a86e8
Mage table color = #c9daf8

Warlock header color = #674ea7
Warlock table color = #b4a7d6


*/

// T4 = 'of the Fallen'
namespace WebApplication5
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                createClassGrid("Warrior", "DPS", dpsWarriorGridView, "#CC4125", "#E6B8AF", "DPS War");
                createClassGrid("Warrior", "Tank", tankWarriorGridView, "#CC4125", "#E6B8AF", "Tank");
                createClassGrid("Rogue", "", rogueGridView, "#ffff00", "#ffe599", "Rogue");
                createClassGrid("Hunter", "", hunterGridView, "#6aa84f", "#b6d7a8", "Hunter");
                createClassGrid("Druid", "", druidGridView, "#ff9900", "#f9cb9c", "Druid");
                createClassGrid("Paladin", "", paladinGridView, "#ff00ff", "#d5a6bd", "Paladin");
                createClassGrid("Priest", "", priestGridView, "#000000", "#cccccc", "Priest");
                createClassGrid("Shaman", "", shamanGridView, "#0070DD", "#c9daf8", "Shaman");
                createClassGrid("Mage", "", mageGridView, "#a86e8", "#c9daf8", "Mage");
                createClassGrid("Warlock", "Shadow", warlockGridView, "#674ea7", "#b4a7d6", "Warlock");
            }
        }

        public void createClassGrid(string playerClass, string playerSubClass, GridView GridViewName, string hexColorInfoRows, string hexColorHeaderRows, string playerGroupHeaderText)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();

            command.CommandType = CommandType.Text;
            if (playerClass.Equals("Warlock") && playerSubClass.Equals("Shadow"))
            {
                command.CommandText = "SELECT PlayerName from Roster where PlayerClass = @PlayerClass or SubClass = @SubClass";
            }
            else
            {
                command.CommandText = "SELECT PlayerName from Roster where PlayerClass = @PlayerClass and SubClass = @SubClass";
            }
            command.Parameters.AddWithValue("@PlayerClass", playerClass);
            command.Parameters.AddWithValue("@SubClass", playerSubClass);

            SqlDataAdapter da = new SqlDataAdapter(command);
            DataTable dtPlayers = new DataTable();
            da.Fill(dtPlayers);

            DataTable dtInfo = new DataTable();
            dtInfo.Columns.Add("PlayerName");
            dtInfo.Columns.Add("ForeverLootScore");
            dtInfo.Columns.Add("ForeverAttendanceValue");
            //dtInfo.Columns.Add("RecentAttendanceValue");
            dtInfo.Columns.Add("RecentPercentageAttendance");
            dtInfo.Columns.Add("PvpLootScore");

            foreach (DataRow playerRow in dtPlayers.Rows)
            {
                string playerName = playerRow["PlayerName"].ToString();

                DataTable dtSinglePlayer = getPlayerInfo(playerName);
                DataRow dr = dtInfo.NewRow();
                foreach (DataRow singlePlayerRow in dtSinglePlayer.Rows)
                {
                    dtInfo.Rows.Add(new Object[]
                    {
                        singlePlayerRow["PlayerName"].ToString(),
                        singlePlayerRow["ForeverLootScore"].ToString(),
                        singlePlayerRow["ForeverAttendanceValue"].ToString(),
                        //singlePlayerRow["RecentAttendanceValue"].ToString(),
                        singlePlayerRow["RecentPercentageAttendance"].ToString(),
                        singlePlayerRow["PvpLootScore"].ToString()
                    });
                }
            }

            connection.Close();
            int rowsPerClass = 15;

            if (GridViewName.Rows.Count < rowsPerClass)
            {
                int rowsToAdd = rowsPerClass - dtInfo.Rows.Count;
                for (int i = 0; i < rowsToAdd; i++)
                {
                    dtInfo.Rows.Add(new Object[]
                    {
                        "",
                        "0",
                        "0",
                        //singlePlayerRow["RecentAttendanceValue"].ToString(),
                        "",
                        "0"
                    });
                }
            }

            GridViewName.DataSource = dtInfo;
            GridViewName.DataBind();

            // Head Rows
            Color headerRowClassColor = ColorTranslator.FromHtml(hexColorInfoRows);
            GridViewName.HeaderRow.BackColor = headerRowClassColor;

            // Rest of Rows Colors
            Color infoRowsClassColor = ColorTranslator.FromHtml(hexColorHeaderRows);
            GridViewName.RowStyle.BackColor = infoRowsClassColor;




        }



#pragma warning disable IDE1006 // Naming Styles
        public DataTable getPlayerInfo(string playerName) // This method assumes we've already broken players down into classes/subclasses
#pragma warning restore IDE1006 // Naming Styles
        {
            DataTable dt = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("recentAttendance", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            command.Parameters.Add("RaidDay", SqlDbType.VarChar).Value = '1';
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC' and playerLoot.itemName NOT LIKE '%T1%'";

            //command.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            DataTable dtPlayers = new DataTable();
            da.Fill(dt);

            connection.Close();

            return dt;
        }

        private void colorGridAttendanceColumn(GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Width = 100;
                }

                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (i == 3) // column index of Percentage Attendance for each player
                    {
                        try
                        {
                            decimal attendancePercentage = Decimal.Parse(e.Row.Cells[i].Text);
                            if (attendancePercentage > 85)
                            {
                                e.Row.Cells[i].BackColor = Color.FromArgb(183, 225, 205); // #b7e1cd Good Attendance color
                                e.Row.Cells[i].Text = e.Row.Cells[i].Text + "%";
                            }
                            else
                            {
                                e.Row.Cells[i].BackColor = Color.FromArgb(244, 199, 195);
                                e.Row.Cells[i].Text = e.Row.Cells[i].Text + "%";
                            }
                        }
                        catch { continue; }
                    }
                }
            }
        }

        protected void dpsWarriorGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }

        protected void tankWarriorGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            colorGridAttendanceColumn(e);
        }

        protected void rogueGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }

        protected void hunterGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }

        protected void druidGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }

        protected void paladinGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }

        protected void priestGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }
        protected void shamanGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }
        protected void mageGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }

        protected void warlockGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            colorGridAttendanceColumn(e);
        }

        protected void getPlayerLootHistory_Click(object sender, EventArgs e)
        {
            if (comboPlayer1.SelectedIndex != -1)
            {
                labelLastLoot1.Visible = true;
                labelT4.Visible = true;
                labelKara.Visible = true;
                labelGruul.Visible = true;
                labelMag.Visible = true;
                labelT5.Visible = true;
                labelSSC.Visible = true;
                labelTK.Visible = true;
                string chooseDropDown = "a";

                DataTable dtWowheadLinks = new DataTable();
                DataTable dtGetRealValue = new DataTable();

                string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();          
                SqlCommand commandGetRealValue = connection.CreateCommand();
                commandGetRealValue.CommandType = CommandType.Text;
                commandGetRealValue.CommandText = @"select distinct ItemName, ItemValue from Loot";

                literalLastLoot1.Text = getLastLootDate(comboPlayer1.SelectedValue, connection);
                string playerClass = getPlayerClass(comboPlayer1.SelectedValue, connection);

                // Populate T4/Kara/Mag/Gruul loot sections of 1st player info drop down
                getKaraLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);
                getGruulLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);
                getMagLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);

                // Populate T5/SSC/TK loot sections of 1st player info drop down
                getSSCLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);
                getTKLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);

                // Populate T6/Hyjal/BT/SWP loot sections of 1st player info drop down
                getHyjalLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);
                getBTLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);
                getSWPLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer1.SelectedValue, chooseDropDown);

                connection.Close();
            }
        }
        protected void getPlayerLootHistory2_Click(object sender, EventArgs e)
        {
            if (comboPlayer2.SelectedIndex != -1)
            {
                labelLastLoot2.Visible = true;
                labelT4b.Visible = true;
                labelKarab.Visible = true;
                labelGruulb.Visible = true;
                labelMagb.Visible = true;
                labelT5b.Visible = true;
                labelSSCb.Visible = true;
                labelTKb.Visible = true;
                string chooseDropDown = "b";

                DataTable dtWowheadLinks = new DataTable();
                DataTable dtGetRealValue = new DataTable();

                string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                //SqlCommand command = connection.CreateCommand();                
                SqlCommand commandGetRealValue = connection.CreateCommand();
                commandGetRealValue.CommandType = CommandType.Text;
                commandGetRealValue.CommandText = @"select distinct ItemName, ItemValue from Loot";

                literalLastLoot2.Text = getLastLootDate(comboPlayer2.SelectedValue, connection);
                string playerClass = getPlayerClass(comboPlayer2.SelectedValue, connection);

                // Populate T4/Kara/Mag/Gruul loot sections of 2nd player info drop down
                getKaraLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);
                getGruulLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);
                getMagLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);

                // Populate T5/SSC/TK loot sections of 2nd player info drop down
                getSSCLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);
                getTKLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);

                // Populate T6/Hyjal/BT/SWP loot sections of 2nd player info drop down
                getHyjalLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);
                getBTLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);
                getSWPLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer2.SelectedValue, chooseDropDown);

                connection.Close();
            }

        }

        protected void getPlayerLootHistory3_Click(object sender, EventArgs e)
        {
            if (comboPlayer3.SelectedIndex != -1)
            {
                labelLastLoot3.Visible = true;
                labelT4c.Visible = true;
                labelKarac.Visible = true;
                labelGruulc.Visible = true;
                labelMagc.Visible = true;
                labelT5c.Visible = true;
                labelSSCc.Visible = true;
                labelTKc.Visible = true;
                string chooseDropDown = "c";

                DataTable dtWowheadLinks = new DataTable();
                DataTable dtGetRealValue = new DataTable();

                string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand commandGetRealValue = connection.CreateCommand();
                commandGetRealValue.CommandType = CommandType.Text;
                commandGetRealValue.CommandText = @"select distinct ItemName, ItemValue from Loot";

                literalLastLoot3.Text = getLastLootDate(comboPlayer3.SelectedValue, connection);
                string playerClass = getPlayerClass(comboPlayer3.SelectedValue, connection);

                // Populate T4/Kara/Mag/Gruul loot sections of 3rd player info drop down
                getKaraLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);
                getGruulLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);
                getMagLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);

                // Populate 54/SSC/TK loot sections of 3rd player info drop down
                getSSCLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);
                getTKLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);

                // Populate T6/Hyjal/BT/SWP loot sections of 3rd player info drop down
                getHyjalLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);
                getBTLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);
                getSWPLoot(connection, commandGetRealValue, dtWowheadLinks, dtGetRealValue, playerClass, comboPlayer3.SelectedValue, chooseDropDown);

                connection.Close();
            }
        }

        protected void getKaraLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootKara", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC' and playerLoot.itemName NOT LIKE '%T1%'";

            //command.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbKaraNonTierLoot = new StringBuilder();
            StringBuilder sbKaraTierLoot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalKara.Text = "<table>";
                literalT4.Text = "<table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalKarab.Text = "<table>";
                literalT4b.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalKarac.Text = "<table>";
                literalT4c.Text = "<table>";
            }            

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {                    
                    string realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();

                if (itemName.Contains("of the Fallen"))
                {
                    sbKaraTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {
                    sbKaraNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalT4.Text += sbKaraTierLoot.ToString();//; + "</table>";
                literalKara.Text += sbKaraNonTierLoot.ToString() + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalT4b.Text += sbKaraTierLoot.ToString();// + "</table>";
                literalKarab.Text += sbKaraNonTierLoot.ToString() + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalT4c.Text += sbKaraTierLoot.ToString();// + "</table>";
                literalKarac.Text += sbKaraNonTierLoot.ToString() + "</table>";
            }
            connection.Close();
        }

        protected void getGruulLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootGruul", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'Gruul'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'Gruul' and playerLoot.itemName NOT LIKE '%T2%'";

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbGruulNonTierLoot = new StringBuilder();
            StringBuilder sbGruulT4Loot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalGruul.Text = "<table>";

            }
            else if (chooseDropDown.Equals("b"))
            {
                literalGruulb.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalGruulc.Text = "<table>";
            }

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {
                    
                    string realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();

                if (itemName.Contains("of the Fallen"))
                {
                    sbGruulT4Loot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {
                    sbGruulNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalGruul.Text += sbGruulNonTierLoot.ToString() + "</table>";
                literalT4.Text += sbGruulT4Loot.ToString();// + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalGruulb.Text += sbGruulNonTierLoot.ToString() + "</table>";
                literalT4b.Text += sbGruulT4Loot.ToString();// + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalGruulc.Text += sbGruulNonTierLoot.ToString() + "</table>";
                literalT4c.Text += sbGruulT4Loot.ToString();// + "</table>";
            }

            connection.Close();
        }

        protected void getMagLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootMag", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'Mag'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'Mag' and playerLoot.itemName NOT LIKE '%T2%'";

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbMagNonTierLoot = new StringBuilder();
            StringBuilder sbMagTierLoot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalMag.Text = "<table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalMagb.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalMagc.Text = "<table>";
            }

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemName = string.Empty;
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {
                    realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();
                if (itemName.Contains("of the Fallen"))
                {                    
                    sbMagTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {                    
                    sbMagNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalT4.Text += sbMagTierLoot.ToString() + "</table>";
                literalMag.Text += sbMagNonTierLoot.ToString() + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalT4b.Text += sbMagTierLoot.ToString() + "</table>";
                literalMagb.Text += sbMagNonTierLoot.ToString() + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalT4c.Text += sbMagTierLoot.ToString() + "</table>";
                literalMagc.Text += sbMagNonTierLoot.ToString() + "</table>";
            }

            connection.Close();
        }

        protected void getSSCLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootSSC", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC' and playerLoot.itemName NOT LIKE '%T1%'";

            //command.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbSSCNonTierLoot = new StringBuilder();
            StringBuilder sbSSCTierLoot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalSSC.Text = "<table>";
                literalT5.Text = "<table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalSSCb.Text = "<table>";
                literalT5b.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalSSCc.Text = "<table>";
                literalT5c.Text = "<table>";
            }

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {
                    string realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();

                if (itemName.Contains("of the Vanquished"))
                {
                    sbSSCTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {
                    sbSSCNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalT5.Text += sbSSCTierLoot.ToString();//; + "</table>";
                literalSSC.Text += sbSSCNonTierLoot.ToString() + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalT5b.Text += sbSSCTierLoot.ToString();// + "</table>";
                literalSSCb.Text += sbSSCNonTierLoot.ToString() + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalT5c.Text += sbSSCTierLoot.ToString();// + "</table>";
                literalSSCc.Text += sbSSCNonTierLoot.ToString() + "</table>";
            }
            connection.Close();
        }

        protected void getTKLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootTK", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC' and playerLoot.itemName NOT LIKE '%T1%'";

            //command.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbTKNonTierLoot = new StringBuilder();
            StringBuilder sbTKTierLoot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalTK.Text = "<table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalTKb.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalTKc.Text = "<table>";
            }

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {
                    string realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();

                if (itemName.Contains("of the Vanquished"))
                {
                    sbTKTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {
                    sbTKNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalT5.Text += sbTKTierLoot.ToString() +"</table>";
                literalTK.Text += sbTKNonTierLoot.ToString() + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalT5b.Text += sbTKTierLoot.ToString() + "</table>";
                literalTKb.Text += sbTKNonTierLoot.ToString() + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalT5c.Text += sbTKTierLoot.ToString() + "</table>";
                literalTKc.Text += sbTKNonTierLoot.ToString() + "</table>";
            }
            connection.Close();
        }

        protected void getHyjalLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootHyjal", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC' and playerLoot.itemName NOT LIKE '%T1%'";

            //command.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbHyjalNonTierLoot = new StringBuilder();
            StringBuilder sbHyjalTierLoot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalHyjal.Text = "<table>";
                literalT6.Text = "<table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalHyjalb.Text = "<table>";
                literalT6b.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalHyjalc.Text = "<table>";
                literalT6c.Text = "<table>";
            }

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {
                    string realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();

                if (itemName.Contains("of the Forgotten"))
                {
                    sbHyjalTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {
                    sbHyjalNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalT6.Text += sbHyjalTierLoot.ToString();//; + "</table>";
                literalHyjal.Text += sbHyjalNonTierLoot.ToString() + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalT6b.Text += sbHyjalTierLoot.ToString();// + "</table>";
                literalHyjalb.Text += sbHyjalNonTierLoot.ToString() + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalT6c.Text += sbHyjalTierLoot.ToString();// + "</table>";
                literalHyjalc.Text += sbHyjalNonTierLoot.ToString() + "</table>";
            }

            connection.Close();
        }

        protected void getBTLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootBT", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC' and playerLoot.itemName NOT LIKE '%T1%'";

            //command.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbBTNonTierLoot = new StringBuilder();
            StringBuilder sbBTTierLoot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalBT.Text = "<table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalBTb.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalBTc.Text = "<table>";
            }

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {
                    string realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();

                if (itemName.Contains("of the Forgotten"))
                {
                    sbBTTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {
                    sbBTNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalT6.Text += sbBTTierLoot.ToString();//; + "</table>";
                literalBT.Text += sbBTNonTierLoot.ToString() + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalT6b.Text += sbBTTierLoot.ToString();// + "</table>";
                literalBTb.Text += sbBTNonTierLoot.ToString() + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalT6c.Text += sbBTTierLoot.ToString();// + "</table>";
                literalBTc.Text += sbBTNonTierLoot.ToString() + "</table>";
            }

            connection.Close();
        }

        protected void getSWPLoot(SqlConnection connection, SqlCommand commandGetRealValue, DataTable dtWowheadLinks, DataTable dtGetRealValue, string playerClass, string playerName, string chooseDropDown)
        {
            dtWowheadLinks.Clear();
            dtGetRealValue.Clear();
            SqlCommand command = new SqlCommand("lootSWP", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@PlayerName", SqlDbType.VarChar).Value = playerName;
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink, PlayerLoot.DateOfRaid, PlayerLoot.ItemValue, PlayerLoot.Spec from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC'";
            //command.CommandText = @"select distinct PlayerLoot.ItemName, Loot.wowheadLink from PlayerLoot inner join Loot on PlayerLoot.ItemName = Loot.ItemName where PlayerLoot.PlayerName = @PlayerName and Loot.RaidName = 'MC' and playerLoot.itemName NOT LIKE '%T1%'";

            //command.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            SqlDataAdapter daGetRealValue = new SqlDataAdapter(commandGetRealValue);
            da.Fill(dtWowheadLinks);
            daGetRealValue.Fill(dtGetRealValue);

            StringBuilder sbSWPNonTierLoot = new StringBuilder();
            StringBuilder sbSWPTierLoot = new StringBuilder();
            if (chooseDropDown.Equals("a"))
            {
                literalSWP.Text = "<table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalSWPb.Text = "<table>";
            }
            else // (chooseDropDown.Equals("c"))
            {
                literalSWPc.Text = "<table>";
            }

            foreach (DataRow linkName in dtWowheadLinks.Rows)
            {
                string itemName = linkName["ItemName"].ToString();
                DateTime dateOfRaid = (DateTime)linkName["DateOfRaid"];
                string format = "MM/dd/yy";
                string dateOfRaidFormattedString = dateOfRaid.ToString(format);
                string itemValue = linkName["ItemValue"].ToString();
                string spec = linkName["Spec"].ToString();

                #region Check for Minor Upgrade and change "spec" variable accordingly
                string realItemValue = string.Empty;

                foreach (DataRow itemRealValue in dtGetRealValue.Rows)
                {
                    string realItemName = itemRealValue["ItemName"].ToString();
                    realItemValue = itemRealValue["ItemValue"].ToString();
                    if (realItemName.Equals(itemName))
                    {
                        realItemName = itemRealValue["ItemName"].ToString();
                        realItemValue = itemRealValue["ItemValue"].ToString();
                        break;
                    }
                }

                if (Convert.ToDouble(itemValue) < Convert.ToDouble(realItemValue))
                {
                    spec = "Minor";
                }
                #endregion

                string wowheadLink = linkName["wowheadLink"].ToString();

                if (itemName.Contains("of the Forgotten"))
                {
                    sbSWPTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
                else
                {
                    sbSWPNonTierLoot.Append("<tr><td><a href=" + wowheadLink + "</a></td><td>&nbsp;[" + itemValue + "]</td><td>&nbsp;[" + spec + "]</td><td>&nbsp;" + dateOfRaidFormattedString + "</td></tr>");
                }
            }

            if (chooseDropDown.Equals("a"))
            {
                literalT6.Text += sbSWPTierLoot.ToString() + "</table>";
                literalSWP.Text += sbSWPNonTierLoot.ToString() + "</table>";
            }
            else if (chooseDropDown.Equals("b"))
            {
                literalT6b.Text += sbSWPTierLoot.ToString() + "</table>";
                literalSWPb.Text += sbSWPNonTierLoot.ToString() + "</table>";
            }
            else //(chooseDropDown.Equals("c"))
            {
                literalT6c.Text += sbSWPTierLoot.ToString() + "</table>";
                literalSWPc.Text += sbSWPNonTierLoot.ToString() + "</table>";
            }
            connection.Close();
        }

        protected string getLastLootDate(string PlayerName, SqlConnection connection)
        {
            string lastLoot = string.Empty;
            SqlCommand playerLastLootDateCommand = connection.CreateCommand();
            playerLastLootDateCommand.CommandType = CommandType.Text;
            playerLastLootDateCommand.CommandText = "select DateOfRaid from PlayerLoot where PlayerName = @PlayerName order by DateOfRaid desc";
            playerLastLootDateCommand.Parameters.AddWithValue("PlayerName", comboPlayer2.SelectedValue);
            DataTable playerLastLootDt = new DataTable();
            SqlDataAdapter lastLootDa = new SqlDataAdapter(playerLastLootDateCommand);
            lastLootDa.Fill(playerLastLootDt);

            if (playerLastLootDt != null && playerLastLootDt.Rows.Count != 0)
            {
                DateTime lastLootDate = (DateTime)playerLastLootDt.Rows[0]["DateOfRaid"];
                string format = "MM/dd/yy";
                lastLoot = lastLootDate.ToString(format);
                //literalLastLoot2.Text = lastLoot;
            }

            connection.Close();

            return lastLoot;
        }

        protected string getPlayerClass(string PlayerName, SqlConnection connection)
        {
            string playerClass = string.Empty;
            SqlCommand playerClassCommand = connection.CreateCommand();
            playerClassCommand.CommandType = CommandType.Text;
            playerClassCommand.CommandText = "select PlayerClass from Roster where PlayerName = @PlayerName";
            playerClassCommand.Parameters.AddWithValue("PlayerName", PlayerName);
            DataTable playerClassDt = new DataTable();
            SqlDataAdapter classDa = new SqlDataAdapter(playerClassCommand);
            classDa.Fill(playerClassDt);
            if (playerClassDt != null && playerClassDt.Rows.Count != 0)
            {
                playerClass = playerClassDt.Rows[0]["PlayerClass"].ToString();
            }

            connection.Close();
            return playerClass;
        }

        protected void getPlayersWithItem_Click(object sender, EventArgs e)
        {
            string getPlayersWithItem = "select PlayerName from PlayerLoot where Itemname = @ItemName and IsActive = 1";

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = getPlayersWithItem;
            command.Parameters.AddWithValue("ItemName", comboItemNameToSearch.SelectedValue);
            da.SelectCommand = command;
            DataTable dt = new DataTable();

            connection.Open();
            da.Fill(dt);
            connection.Close();

            List<string> listPlayersWithItem = new List<string>();

            foreach (DataRow playerName in dt.Rows)
            {
                string player = playerName["PlayerName"].ToString();
                //labelHasMagBag.Text = labelHasMagBag.Text + itemName + ", ";
                listPlayersWithItem.Add(player);
            }

            labelPlayersWithItem.Visible = true;
            string[] arrayPlayersWithItem = listPlayersWithItem.ToArray();
            string allPlayersWithItem = string.Join(", ", arrayPlayersWithItem.Where(s => !string.IsNullOrEmpty(s)));
            if (arrayPlayersWithItem.Length == 0)
            {
                labelPlayersWithItem.Text = "No players have this item";
            }
            else
            {
                labelPlayersWithItem.Text = allPlayersWithItem;
            }

            connection.Close();
        }

        protected void getPlayerAttendanceHistory_Click(object sender, EventArgs e)
        {
            string getPlayerAttendanceHistoryQuery = "  select RaidDate, AttendanceValue, WeekdayName, Bench, MC, Mag, Gruul, AQ40, Naxx from Attendance where PlayerName = @PlayerName order by RaidDate asc";

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = getPlayerAttendanceHistoryQuery;
            command.Parameters.AddWithValue("PlayerName", comboPlayerAttendanceHistory.SelectedValue);
            da.SelectCommand = command;
            DataTable dt = new DataTable();

            connection.Open();
            da.Fill(dt);
            connection.Close();

            string start = "<td>";
            string end = "</td>";
            string tab = "&emsp;&emsp;";

            StringBuilder sbPlayerAttendance = new StringBuilder();
            sbPlayerAttendance.Append("<table><tr><th>RaidDate&emsp;&emsp;</th><th>Day&emsp;&emsp;</th><th>AttendanceValue&emsp;&emsp;</th><th>Notes&emsp;&emsp;</th><th>MC&emsp;&emsp;</th><th>Mag&emsp;&emsp;</th><th>Gruul&emsp;&emsp;</th><th>AQ40&emsp;&emsp;</th><th>Naxx</th>");
            foreach (DataRow dataRow in dt.Rows)
            {
                DateTime raidDate = (DateTime)dataRow["RaidDate"];
                string raidDateString = raidDate.ToString("yyyy-MM-dd");
                string day = dataRow["WeekdayName"].ToString();
                string attendanceValue = dataRow["AttendanceValue"].ToString();
                string notes = dataRow["Bench"].ToString();
                string MC = Convert.ToInt32((bool)dataRow["MC"]).ToString();
                string Mag = Convert.ToInt32((bool)dataRow["Mag"]).ToString();
                string Gruul = Convert.ToInt32((bool)dataRow["Gruul"]).ToString();
                string AQ40 = Convert.ToInt32((bool)dataRow["AQ40"]).ToString();
                string Naxx = Convert.ToInt32((bool)dataRow["Naxx"]).ToString();

                sbPlayerAttendance.Append("<tr>" + start + raidDateString + tab + end + start + day + tab + end + start + attendanceValue + end + start + notes + end + start + MC + end + start + Mag + end + start + Gruul + end + start + AQ40 + end + start + Naxx + end + "</tr>");

            }

            sbPlayerAttendance.Append("</table>");
            literalAttendanceHistory.Text = sbPlayerAttendance.ToString();

            connection.Close();
        }
    }
}