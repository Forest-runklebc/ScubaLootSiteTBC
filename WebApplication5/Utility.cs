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
    public class Utility
    {
        // TODO - Add logic to only give partial percentage loot value to hunters getting melee weapons and melee getting ranged weapons
        // TODO - 
        public static void InsertPlayerlootQuery(string playerName, string itemName, string spec, string dateOfRaid, bool isSidegrade)
        {
            List<string> rangedWeaponsForMelee = new List<string> { "Larvae of the Great Worm", "Nerubian Slavemaker" };
            List<string> meleeWeaponsForHunters = new List<string> { "Brutality Blade",  "Core Hound Tooth", "Dragonfang Blade", "Doom's Edge",
                "Crul'shorukh, Edge of Chaos", "Imperial Qiraji Armaments", "Ancient Qiraji Ripper", "Harbinger of Doom", "Iblis, Blade of the Fallen Seraph", "Claw of the Frost Wyrm", "Kingsfall" };

            if (playerName == null || playerName.Equals(string.Empty) || itemName == null || itemName.Equals(string.Empty))
            {
                return;
            }
            string insertPlayerLootQuery = "INSERT INTO PlayerLoot (PlayerName, ItemName, ItemValue, Spec, RaidName, DateOfRaid) " +
                                        "VALUES   (@PlayerName, @ItemName, @ItemValue, @Spec, @RaidName, @DateOfRaid)";

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            /* Get ItemValue */
            if (itemName.Contains("'") && !itemName.Contains("''"))
            {
                itemName = itemName.Replace("'", "''");
            }
            string itemValueQuery = "SELECT distinct ItemValue from LOOT where ItemName = '" + itemName + "'";
            SqlCommand commandGetItemValue = new SqlCommand(itemValueQuery, connection);
            SqlDataReader reader = commandGetItemValue.ExecuteReader();
            double itemValue = 0;
            double itemValueSidegrade = 0;
            if (reader.Read())
            {
                itemValue = Convert.ToDouble(reader["ItemValue"]);
                reader.Close();
            }
            else
            {
                reader.Close();
            }

            // Handle melee or hunters getting items that are better for the opposite role, should cost less for the classes that don't benefit as much. 
            // (Hunters getting melee weapons / Melee getting ranged weapons)
            if (rangedWeaponsForMelee.Contains(itemName) || meleeWeaponsForHunters.Contains(itemName))
            {
                /* Get PlayerClass */
                string playerClassQuery = "SELECT PlayerClass from Roster where PlayerName = '" + playerName + "'";
                SqlCommand commandGetPlayerClass = new SqlCommand(playerClassQuery, connection);
                SqlDataReader reader1 = commandGetPlayerClass.ExecuteReader();
                string playerClass = string.Empty;
                if (reader1.Read())
                {
                    playerClass = reader1["PlayerClass"].ToString();
                    reader1.Close();
                }

                if (playerClass.Equals("Hunter") && meleeWeaponsForHunters.Contains(itemName))
                {
                    itemValue = itemValue * 0.5;
                }
                if ((playerClass.Equals("Warrior") || playerClass.Equals("Rogue")) && rangedWeaponsForMelee.Contains(itemName))
                {
                    itemValue = itemValue * 0.5;
                }
            }


            // Handle Sidegrade items - aka items that no one really needs or wants but would be best if someone still took it.
            itemValueSidegrade = itemValue * 0.25;
            if (!spec.Equals("Offspec"))
            {
                if (spec.Equals("Mainspec"))
                {
                    /* Update Mainspec Player LootScore */
                    if (isSidegrade)
                    {
                        string updatePlayerLootScore = "UPDATE Roster SET LootScore = LootScore + " + itemValueSidegrade + " WHERE PlayerName = '" + playerName + "'";
                        SqlCommand commandUpdatePlayerLootScore = new SqlCommand(updatePlayerLootScore, connection);
                        commandUpdatePlayerLootScore.ExecuteNonQuery();
                    }
                    else
                    {
                        string updatePlayerLootScore = "UPDATE Roster SET LootScore = LootScore + " + itemValue + " WHERE PlayerName = '" + playerName + "'";
                        SqlCommand commandUpdatePlayerLootScore = new SqlCommand(updatePlayerLootScore, connection);
                        commandUpdatePlayerLootScore.ExecuteNonQuery();
                    }


                }
                else
                {
                    /* Update Pvp/Offspec Player LootScore */
                    if (isSidegrade)
                    {
                        string updatePlayerLootScore = "UPDATE Roster SET PvpLootScore = PvpLootScore + " + itemValueSidegrade + " WHERE PlayerName = '" + playerName + "'";
                        SqlCommand commandUpdatePlayerLootScore = new SqlCommand(updatePlayerLootScore, connection);
                        commandUpdatePlayerLootScore.ExecuteNonQuery();
                    }
                    else
                    {
                        string updatePlayerLootScore = "UPDATE Roster SET PvpLootScore = PvpLootScore + " + itemValue + " WHERE PlayerName = '" + playerName + "'";
                        SqlCommand commandUpdatePlayerLootScore = new SqlCommand(updatePlayerLootScore, connection);
                        commandUpdatePlayerLootScore.ExecuteNonQuery();
                    }

                }
            }


            /* Get RaidName */
            string itemRaidName = "SELECT distinct RaidName from LOOT where ItemName = '" + itemName + "'";
            SqlCommand commandGetRaidName = new SqlCommand(itemRaidName, connection);
            reader = commandGetRaidName.ExecuteReader();
            string raidName = String.Empty;
            if (reader.Read())
            {
                raidName = reader["RaidName"].ToString();
                reader.Close();
            }
            else
            {
                reader.Close();
            }

            SqlCommand command = new SqlCommand(insertPlayerLootQuery, connection);
            while (itemName.Contains("''")) // Make sure we're not inserting items with 2 single quotes into the database when we had to previously escape them earlier in this method to search properly in SQL
            {
                string firstHalf = string.Empty;
                string secondHalf = string.Empty;
                int indexOfFirstDoubleQuote = itemName.IndexOf("''");
                firstHalf = itemName.Substring(0, indexOfFirstDoubleQuote);
                secondHalf = itemName.Substring(indexOfFirstDoubleQuote + 1);

                itemName = firstHalf + secondHalf;
            }

            // string dateOfRaid = calendarAQ40.SelectedDate.ToString("yyyy-MM-dd");

            command.Parameters.AddWithValue("@PlayerName", playerName);
            command.Parameters.AddWithValue("@ItemName", itemName);
            command.Parameters.AddWithValue("@ItemValue", isSidegrade ? itemValueSidegrade : itemValue);
            command.Parameters.AddWithValue("@Spec", spec);
            command.Parameters.AddWithValue("@RaidName", raidName);
            command.Parameters.AddWithValue("@DateOfRaid", dateOfRaid);

            command.ExecuteNonQuery();

            connection.Close();
        }

        public static void getRaidsForSelectedDate(Calendar calendarName, Label labelName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            string selectRaidsRunOnDate = "select distinct RaidDate, WeekdayName, MC, Ony, BWL, AQ40, Naxx from Attendance where RaidDate = @RaidDate";
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand command = connection.CreateCommand();
            command.CommandText = selectRaidsRunOnDate;
            command.Parameters.AddWithValue("RaidDate", calendarName.SelectedDate.ToString());

            da.SelectCommand = command;
            DataSet ds = new DataSet();
            connection.Open();
            da.Fill(ds);
            connection.Close();

            if (ds != null && ds.Tables.Count != 0 && ds.Tables[0].Rows.Count != 0)
            {
                DateTime raidDate = DateTime.Parse(ds.Tables[0].Rows[0]["RaidDate"].ToString());
                string stringRaidDate = raidDate.ToString("dddd, dd MMMM yyyy");
                // string weekday = ds.Tables[0].Rows[0]["WeekdayName"].ToString();
                string MC = ds.Tables[0].Rows[0]["MC"].ToString();
                string Ony = ds.Tables[0].Rows[0]["Ony"].ToString();
                string BWL = ds.Tables[0].Rows[0]["BWL"].ToString();
                string AQ40 = ds.Tables[0].Rows[0]["AQ40"].ToString();
                string Naxx = ds.Tables[0].Rows[0]["Naxx"].ToString();

                MC = MC.Equals("True") ? "MC" : string.Empty;
                Ony = Ony.Equals("True") ? "Ony" : string.Empty;
                BWL = BWL.Equals("True") ? "BWL" : string.Empty;
                AQ40 = AQ40.Equals("True") ? "AQ40" : string.Empty;
                Naxx = Naxx.Equals("True") ? "Naxx" : string.Empty;

                string[] raidArray = new string[] { MC, Ony, BWL, AQ40, Naxx };
                string completedRaids = string.Join(", ", raidArray.Where(s => !string.IsNullOrEmpty(s)));
                // completedRaids = completedRaids.Equals(string.Empty) ? " No Raid Recorded" : completedRaids;

                labelName.Text = stringRaidDate + ": " + completedRaids;
            }
            else
            {
                DateTime raidDate = calendarName.SelectedDate;
                string stringRaidDate = raidDate.ToString("dddd, dd MMMM yyyy");
                labelName.Text = stringRaidDate + ": No Raid(s) Recorded";
            }
        }
    }
}