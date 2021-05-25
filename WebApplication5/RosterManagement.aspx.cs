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

namespace WebApplication5
{
    public partial class RosterManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            TextBox textBox = comboUpdatePlayer1.FindControl("TextBox") as TextBox;

            if (textBox != null)
            {
                textBox.Attributes.Add("onBlur", "comboUpdatePlayer1_OnBlur(this);");
            }
        }

        protected void buttonAddNewPlayers_Click(object sender, EventArgs e)
        {
            insertNewPlayerToRoster(comboNewPlayer1.SelectedValue, comboNewPlayerRank1.SelectedValue, comboNewPlayerClass1.SelectedValue, comboNewPlayerSubClass1.SelectedValue, comboRaidDay1.SelectedValue, radioNewActive1.SelectedValue);
            insertNewPlayerToRoster(comboNewPlayer2.SelectedValue, comboNewPlayerRank2.SelectedValue, comboNewPlayerClass2.SelectedValue, comboNewPlayerSubClass2.SelectedValue, comboRaidDay2.SelectedValue, radioNewActive2.SelectedValue);
            insertNewPlayerToRoster(comboNewPlayer3.SelectedValue, comboNewPlayerRank3.SelectedValue, comboNewPlayerClass3.SelectedValue, comboNewPlayerSubClass3.SelectedValue, comboRaidDay3.SelectedValue, radioNewActive3.SelectedValue);

            #region reset boxes
            comboNewPlayer1.SelectedIndex = -1;
            comboNewPlayer2.SelectedIndex = -1;
            comboNewPlayer3.SelectedIndex = -1;

            comboNewPlayerRank1.SelectedIndex = -1;
            comboNewPlayerRank2.SelectedIndex = -1;
            comboNewPlayerRank3.SelectedIndex = -1;

            comboNewPlayerClass1.SelectedIndex = -1;
            comboNewPlayerClass2.SelectedIndex = -1;
            comboNewPlayerClass3.SelectedIndex = -1;

            comboNewPlayerSubClass1.SelectedIndex = -1;
            comboNewPlayerSubClass2.SelectedIndex = -1;
            comboNewPlayerSubClass3.SelectedIndex = -1;

            radioNewActive1.SelectedIndex = 0;
            radioNewActive2.SelectedIndex = 0;
            radioNewActive3.SelectedIndex = 0;

            comboUpdatePlayer1.SelectedIndex = -1;
            comboUpdatePlayer2.SelectedIndex = -1;
            comboUpdatePlayer3.SelectedIndex = -1;

            comboUpdateRanks1.SelectedIndex = -1;
            comboUpdateRanks2.SelectedIndex = -1;
            comboUpdateRanks3.SelectedIndex = -1;

            comboUpdateClass1.SelectedIndex = -1;
            comboUpdateClass2.SelectedIndex = -1;
            comboUpdateClass3.SelectedIndex = -1;

            comboUpdateSubClass1.SelectedIndex = -1;
            comboUpdateSubClass2.SelectedIndex = -1;
            comboUpdateSubClass3.SelectedIndex = -1;

            radioUpdateActive1.SelectedIndex = 0;
            radioUpdateActive2.SelectedIndex = 0;
            radioUpdateActive3.SelectedIndex = 0;
            #endregion

        }

        public void insertNewPlayerToRoster(string player, string rank, string className, string subClass, string raidDay, string isActive)
        {
            if (!player.Equals(string.Empty) || !rank.Equals(string.Empty) || !className.Equals(string.Empty))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                string checkPlayerAlreadyExists = "Select PlayerName from Roster where PlayerName = @PlayerName";

                SqlDataAdapter da = new SqlDataAdapter();
                SqlCommand commandCheckPlayerAlreadyExists = connection.CreateCommand();
                commandCheckPlayerAlreadyExists.CommandText = checkPlayerAlreadyExists;
                commandCheckPlayerAlreadyExists.Parameters.AddWithValue("PlayerName", player);
                da.SelectCommand = commandCheckPlayerAlreadyExists;
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    string insertPlayerIntoRoster = "INSERT INTO Roster (PlayerName, PlayerRank, PlayerClass, SubClass, RaidDay, JoinDate) " +
                                                        "Values (@PlayerName, @PlayerRank, @PlayerClass, @SubClass, @RaidDay, @JoinDate)";

                    string insertPlayerIntoZG = "INSERT INTO ZulGurub (PlayerName) Values (@PlayerName)";



                    SqlCommand commandInsertRoster = new SqlCommand(insertPlayerIntoRoster, connection);
                    commandInsertRoster.Parameters.AddWithValue("PlayerName", player);
                    commandInsertRoster.Parameters.AddWithValue("PlayerRank", rank);
                    commandInsertRoster.Parameters.AddWithValue("PlayerClass", className);
                    commandInsertRoster.Parameters.AddWithValue("SubClass", subClass);
                    commandInsertRoster.Parameters.AddWithValue("RaidDay", raidDay);
                    if (isActive.Equals("Active"))
                    {
                        commandInsertRoster.Parameters.AddWithValue("IsActive", "1");
                    }
                    else
                    {
                        commandInsertRoster.Parameters.AddWithValue("IsActive", "0");
                    }
                    commandInsertRoster.Parameters.AddWithValue("JoinDate", System.DateTime.Today.ToString("yyyy-MM-dd"));
                    commandInsertRoster.ExecuteNonQuery();

                    SqlCommand commandInsertZG = new SqlCommand(insertPlayerIntoZG, connection);
                    commandInsertZG.Parameters.AddWithValue("PlayerName", player);
                    commandInsertZG.ExecuteNonQuery();

                }
                connection.Close();
            }
        }

        protected void buttonUpdateExistingPlayers_Click(object sender, EventArgs e)
        {
            updateExistingPlayer(comboUpdatePlayer1.SelectedValue, comboUpdateRanks1.SelectedValue, comboUpdateClass1.SelectedValue, comboUpdateSubClass1.SelectedValue, comboUpdateRaidDay1.SelectedValue, radioUpdateActive1.SelectedValue);
            updateExistingPlayer(comboUpdatePlayer2.SelectedValue, comboUpdateRanks2.SelectedValue, comboUpdateClass2.SelectedValue, comboUpdateSubClass2.SelectedValue, comboUpdateRaidDay2.SelectedValue, radioUpdateActive2.SelectedValue);
            updateExistingPlayer(comboUpdatePlayer3.SelectedValue, comboUpdateRanks3.SelectedValue, comboUpdateClass3.SelectedValue, comboUpdateSubClass3.SelectedValue, comboUpdateRaidDay3.SelectedValue, radioUpdateActive3.SelectedValue);
            #region reset boxes
            comboNewPlayer1.SelectedIndex = -1;
            comboNewPlayer2.SelectedIndex = -1;
            comboNewPlayer3.SelectedIndex = -1;

            comboNewPlayerRank1.SelectedIndex = -1;
            comboNewPlayerRank2.SelectedIndex = -1;
            comboNewPlayerRank3.SelectedIndex = -1;

            comboNewPlayerClass1.SelectedIndex = -1;
            comboNewPlayerClass2.SelectedIndex = -1;
            comboNewPlayerClass3.SelectedIndex = -1;

            comboNewPlayerSubClass1.SelectedIndex = -1;
            comboNewPlayerSubClass2.SelectedIndex = -1;
            comboNewPlayerSubClass3.SelectedIndex = -1;

            comboRaidDay1.SelectedIndex = -1;
            comboRaidDay2.SelectedIndex = -1;
            comboRaidDay3.SelectedIndex = -1;

            radioNewActive1.SelectedIndex = 0;
            radioNewActive2.SelectedIndex = 0;
            radioNewActive3.SelectedIndex = 0;

            comboUpdatePlayer1.SelectedIndex = -1;
            comboUpdatePlayer2.SelectedIndex = -1;
            comboUpdatePlayer3.SelectedIndex = -1;

            comboUpdateRanks1.SelectedIndex = -1;
            comboUpdateRanks2.SelectedIndex = -1;
            comboUpdateRanks3.SelectedIndex = -1;

            comboUpdateClass1.SelectedIndex = -1;
            comboUpdateClass2.SelectedIndex = -1;
            comboUpdateClass3.SelectedIndex = -1;

            comboUpdateSubClass1.SelectedIndex = -1;
            comboUpdateSubClass2.SelectedIndex = -1;
            comboUpdateSubClass3.SelectedIndex = -1;

            comboUpdateRaidDay1.SelectedIndex = -1;
            comboUpdateRaidDay2.SelectedIndex = -1;
            comboUpdateRaidDay3.SelectedIndex = -1;

            radioUpdateActive1.SelectedIndex = 0;
            radioUpdateActive2.SelectedIndex = 0;
            radioUpdateActive3.SelectedIndex = 0;
            #endregion

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Updates Accepted" + "');", true);
        }

        public void updateExistingPlayer(string player, string rank, string className, string subClass, string raidDay, string isActive)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            string getExistingPlayerInfo = "SELECT PlayerRank, PlayerClass, SubClass, RaidDay, IsActive from Roster where PlayerName = @PlayerName";
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand commandGetExistingPlayerInfo = connection.CreateCommand();
            commandGetExistingPlayerInfo.CommandText = getExistingPlayerInfo;
            commandGetExistingPlayerInfo.Parameters.AddWithValue("PlayerName", player);
            da.SelectCommand = commandGetExistingPlayerInfo;
            DataTable dt = new DataTable();
            connection.Open();
            da.Fill(dt);

            string existingRank = string.Empty;
            string existingClass = string.Empty;
            string existingSubClass = string.Empty;
            string existingRaidDay = string.Empty;
            string existingIsActive = string.Empty;

            foreach (DataRow row in dt.Rows)
            {
                existingRank = row["PlayerRank"].ToString();
                existingClass = row["PlayerClass"].ToString();
                existingRaidDay = row["RaidDay"].ToString();
                existingSubClass = row["SubClass"].ToString();
            }

            // Make sure we don't overwrite values that are the same in the DB and screen
            rank = existingRank.Equals(rank) ? existingRank : rank;
            className = existingClass.Equals(className) ? existingClass : className;
            raidDay = existingRaidDay.Equals(raidDay) ? existingRaidDay : raidDay;
            subClass = (existingSubClass.Equals(subClass) || existingSubClass.Equals("")) ? existingSubClass : subClass;
            if (!(className.Equals("Warrior") || className.Equals("Priest")))
            {
                subClass = string.Empty;
            }
            isActive = isActive.Equals("Active") ? "True" : "False";

            string updateExistingPlayer = "UPDATE Roster SET PlayerRank = @PlayerRank, PlayerClass = @PlayerClass, SubClass = @SubClass, RaidDay = @RaidDay, IsActive = @IsActive WHERE PlayerName = @PlayerName";
            SqlCommand commandUpdateExistingPlayer = new SqlCommand(updateExistingPlayer, connection);
            commandUpdateExistingPlayer.Parameters.AddWithValue("PlayerRank", rank);
            commandUpdateExistingPlayer.Parameters.AddWithValue("PlayerClass", className);
            commandUpdateExistingPlayer.Parameters.AddWithValue("SubClass", subClass);
            commandUpdateExistingPlayer.Parameters.AddWithValue("RaidDay", raidDay);
            commandUpdateExistingPlayer.Parameters.AddWithValue("IsActive", isActive);
            commandUpdateExistingPlayer.Parameters.AddWithValue("PlayerName", player);

            commandUpdateExistingPlayer.ExecuteNonQuery();

            connection.Close();
        }

        protected void comboUpdatePlayer1_TextChanged(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            string getExistingPlayerInfo = "SELECT PlayerRank, PlayerClass, SubClass, RaidDay, IsActive from Roster where PlayerName = @PlayerName";
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand commandGetExistingPlayerInfo = connection.CreateCommand();
            commandGetExistingPlayerInfo.CommandText = getExistingPlayerInfo;
            commandGetExistingPlayerInfo.Parameters.AddWithValue("PlayerName", comboUpdatePlayer1.Text);
            da.SelectCommand = commandGetExistingPlayerInfo;
            DataTable dt = new DataTable();
            connection.Open();
            da.Fill(dt);

            string existingRank = string.Empty;
            string existingClass = string.Empty;
            string existingSubClass = string.Empty;
            string existingRaidDay = string.Empty;
            string existingIsActive = string.Empty;

            foreach (DataRow row in dt.Rows)
            {
                existingRank = row["PlayerRank"].ToString();
                existingClass = row["PlayerClass"].ToString();
                existingSubClass = row["SubClass"].ToString();
                existingRaidDay = row["RaidDay"].ToString();
                existingIsActive = row["IsActive"].ToString();
            }

            if (!existingRank.Equals("")) comboUpdateRanks1.Text = existingRank;
            if (!existingClass.Equals("")) comboUpdateClass1.Text = existingClass;
            if (!existingSubClass.Equals("")) comboUpdateSubClass1.Text = existingSubClass;
            if (!existingRaidDay.Equals("")) comboUpdateRaidDay1.Text = existingRaidDay;
            radioUpdateActive1.SelectedIndex = existingIsActive.Equals("True") ? 0 : 1;
        }

        protected void comboUpdatePlayer2_TextChanged(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            string getExistingPlayerInfo = "SELECT PlayerRank, PlayerClass, SubClass, RaidDay, IsActive from Roster where PlayerName = @PlayerName";
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand commandGetExistingPlayerInfo = connection.CreateCommand();
            commandGetExistingPlayerInfo.CommandText = getExistingPlayerInfo;
            commandGetExistingPlayerInfo.Parameters.AddWithValue("PlayerName", comboUpdatePlayer2.Text);
            da.SelectCommand = commandGetExistingPlayerInfo;
            DataTable dt = new DataTable();
            connection.Open();
            da.Fill(dt);

            string existingRank = string.Empty;
            string existingClass = string.Empty;
            string existingSubClass = string.Empty;
            string existingRaidDay = string.Empty;
            string existingIsActive = string.Empty;

            foreach (DataRow row in dt.Rows)
            {
                existingRank = row["PlayerRank"].ToString();
                existingClass = row["PlayerClass"].ToString();
                existingSubClass = row["SubClass"].ToString();
                existingRaidDay = row["RaidDay"].ToString();
                existingIsActive = row["IsActive"].ToString();
            }

            if (!existingRank.Equals("")) comboUpdateRanks2.Text = existingRank;
            if (!existingClass.Equals("")) comboUpdateClass2.Text = existingClass;
            if (!existingSubClass.Equals("")) comboUpdateSubClass2.Text = existingSubClass;
            if (!existingRaidDay.Equals("")) comboUpdateRaidDay2.Text = existingRaidDay;
            radioUpdateActive2.SelectedIndex = existingIsActive.Equals("True") ? 0 : 1;
        }

        protected void comboUpdatePlayer3_TextChanged(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            string getExistingPlayerInfo = "SELECT PlayerRank, PlayerClass, SubClass, RaidDay, IsActive from Roster where PlayerName = @PlayerName";
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand commandGetExistingPlayerInfo = connection.CreateCommand();
            commandGetExistingPlayerInfo.CommandText = getExistingPlayerInfo;
            commandGetExistingPlayerInfo.Parameters.AddWithValue("PlayerName", comboUpdatePlayer3.Text);
            da.SelectCommand = commandGetExistingPlayerInfo;
            DataTable dt = new DataTable();
            connection.Open();
            da.Fill(dt);

            string existingRank = string.Empty;
            string existingClass = string.Empty;
            string existingSubClass = string.Empty;
            string existingRaidDay = string.Empty;
            string existingIsActive = string.Empty;

            foreach (DataRow row in dt.Rows)
            {
                existingRank = row["PlayerRank"].ToString();
                existingClass = row["PlayerClass"].ToString();
                existingSubClass = row["SubClass"].ToString();
                existingRaidDay = row["RaidDay"].ToString();
                existingIsActive = row["IsActive"].ToString();
            }

            if (!existingRank.Equals("")) comboUpdateRanks3.Text = existingRank;
            if (!existingClass.Equals("")) comboUpdateClass3.Text = existingClass;
            if (!existingSubClass.Equals("")) comboUpdateSubClass3.Text = existingSubClass;
            if (!existingRaidDay.Equals("")) comboUpdateRaidDay3.Text = existingRaidDay;
            radioUpdateActive3.SelectedIndex = existingIsActive.Equals("True") ? 0 : 1;
        }
    }
}