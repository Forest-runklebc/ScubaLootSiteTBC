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
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                calendarAttendance.SelectedDate = DateTime.Today;
                Utility.getRaidsForSelectedDate(calendarAttendance, labelRaidsRun);

                SubmitNewRaid.Enabled = false;
                SubmitNewRaid.ToolTip = "Must choose at least 1 raid";

                labelErrorRaidAlreadyExists.Visible = false;

                DataSet rosterList = getEntireActiveRosterByClass();
                List<string> playersOnActiveRoster = new List<string>();

                foreach (DataRow playerName in rosterList.Tables[0].Rows)
                {
                    string player = playerName["PlayerName"].ToString();
                    playersOnActiveRoster.Add(player + "</br>");
                }

                string[] playersOnActiveRosterArray = playersOnActiveRoster.ToArray();
                string allPlayersOnActiveRoster = string.Join("", playersOnActiveRosterArray.Where(s => !string.IsNullOrEmpty(s)));
                playersOnRoster.Text = allPlayersOnActiveRoster;


            }
        }

        protected void SubmitNewRaid_Click(object sender, EventArgs e)
        {
            InsertPlayerAttendanceQuery(comboPlayer1.SelectedValue, comboAttendanceValue1.SelectedValue, radioAttendanceStatus1.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer2.SelectedValue, comboAttendanceValue2.SelectedValue, radioAttendanceStatus2.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer3.SelectedValue, comboAttendanceValue3.SelectedValue, radioAttendanceStatus3.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer4.SelectedValue, comboAttendanceValue4.SelectedValue, radioAttendanceStatus4.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer5.SelectedValue, comboAttendanceValue5.SelectedValue, radioAttendanceStatus5.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer6.SelectedValue, comboAttendanceValue6.SelectedValue, radioAttendanceStatus6.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer7.SelectedValue, comboAttendanceValue7.SelectedValue, radioAttendanceStatus7.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer8.SelectedValue, comboAttendanceValue8.SelectedValue, radioAttendanceStatus8.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer9.SelectedValue, comboAttendanceValue9.SelectedValue, radioAttendanceStatus9.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer10.SelectedValue, comboAttendanceValue10.SelectedValue, radioAttendanceStatus10.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer11.SelectedValue, comboAttendanceValue11.SelectedValue, radioAttendanceStatus11.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer12.SelectedValue, comboAttendanceValue12.SelectedValue, radioAttendanceStatus12.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer13.SelectedValue, comboAttendanceValue13.SelectedValue, radioAttendanceStatus13.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer14.SelectedValue, comboAttendanceValue14.SelectedValue, radioAttendanceStatus14.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer15.SelectedValue, comboAttendanceValue15.SelectedValue, radioAttendanceStatus15.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer16.SelectedValue, comboAttendanceValue16.SelectedValue, radioAttendanceStatus16.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer17.SelectedValue, comboAttendanceValue17.SelectedValue, radioAttendanceStatus17.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer18.SelectedValue, comboAttendanceValue18.SelectedValue, radioAttendanceStatus18.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer19.SelectedValue, comboAttendanceValue19.SelectedValue, radioAttendanceStatus19.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer20.SelectedValue, comboAttendanceValue20.SelectedValue, radioAttendanceStatus20.SelectedValue);

            List<string> benchedPlayers = getBenchedPlayers();
            DataSet entireRaidRoster = getEntireActiveRoster();
            List<DataRow> rowsToDelete = new List<DataRow>();
            foreach (DataRow row in entireRaidRoster.Tables[0].Rows)
            {
                if (benchedPlayers.Contains(row["PlayerName"]))
                {
                    rowsToDelete.Add(row);
                }
            }

            foreach (DataRow row in rowsToDelete)
            {
                entireRaidRoster.Tables[0].Rows.Remove(row);
            }

            List<string> remainingRosterToSubmit = new List<string>();

            foreach (DataRow row in entireRaidRoster.Tables[0].Rows)
            {
                remainingRosterToSubmit.Add(row["PlayerName"].ToString());
            }

            foreach (string playerName in remainingRosterToSubmit)
            {
                InsertPlayerAttendanceQuery(playerName, "1.00", "");
            }

            #region Reset Textboxes
            CheckBoxRaids.SelectedIndex = -1;

            comboPlayer1.SelectedIndex = -1;
            comboAttendanceValue1.SelectedIndex = -1;
            radioAttendanceStatus1.SelectedValue = "Missing";

            comboPlayer2.SelectedIndex = -1;
            comboAttendanceValue2.SelectedIndex = -1;
            radioAttendanceStatus2.SelectedValue = "Missing";

            comboPlayer3.SelectedIndex = -1;
            comboAttendanceValue3.SelectedIndex = -1;
            radioAttendanceStatus3.SelectedValue = "Missing";

            comboPlayer4.SelectedIndex = -1;
            comboAttendanceValue4.SelectedIndex = -1;
            radioAttendanceStatus4.SelectedValue = "Missing";

            comboPlayer5.SelectedIndex = -1;
            comboAttendanceValue5.SelectedIndex = -1;
            radioAttendanceStatus5.SelectedValue = "Missing";

            comboPlayer6.SelectedIndex = -1;
            comboAttendanceValue6.SelectedIndex = -1;
            radioAttendanceStatus6.SelectedValue = "Missing";

            comboPlayer7.SelectedIndex = -1;
            comboAttendanceValue7.SelectedIndex = -1;
            radioAttendanceStatus7.SelectedValue = "Missing";

            comboPlayer8.SelectedIndex = -1;
            comboAttendanceValue8.SelectedIndex = -1;
            radioAttendanceStatus8.SelectedValue = "Missing";

            comboPlayer9.SelectedIndex = -1;
            comboAttendanceValue9.SelectedIndex = -1;
            radioAttendanceStatus9.SelectedValue = "Missing";

            comboPlayer10.SelectedIndex = -1;
            comboAttendanceValue10.SelectedIndex = -1;
            radioAttendanceStatus10.SelectedValue = "Missing";



            comboPlayer11.SelectedIndex = -1;
            comboAttendanceValue11.SelectedIndex = -1;
            radioAttendanceStatus12.SelectedValue = "Missing";


            comboPlayer12.SelectedIndex = -1;
            comboAttendanceValue12.SelectedIndex = -1;
            radioAttendanceStatus12.SelectedValue = "Missing";


            comboPlayer13.SelectedIndex = -1;
            comboAttendanceValue13.SelectedIndex = -1;
            radioAttendanceStatus13.SelectedValue = "Missing";


            comboPlayer14.SelectedIndex = -1;
            comboAttendanceValue14.SelectedIndex = -1;
            radioAttendanceStatus14.SelectedValue = "Missing";


            comboPlayer15.SelectedIndex = -1;
            comboAttendanceValue15.SelectedIndex = -1;
            radioAttendanceStatus15.SelectedValue = "Missing";


            comboPlayer16.SelectedIndex = -1;
            comboAttendanceValue16.SelectedIndex = -1;
            radioAttendanceStatus16.SelectedValue = "Missing";


            comboPlayer17.SelectedIndex = -1;
            comboAttendanceValue17.SelectedIndex = -1;
            radioAttendanceStatus17.SelectedValue = "Missing";


            comboPlayer18.SelectedIndex = -1;
            comboAttendanceValue18.SelectedIndex = -1;
            radioAttendanceStatus18.SelectedValue = "Missing";


            comboPlayer19.SelectedIndex = -1;
            comboAttendanceValue19.SelectedIndex = -1;
            radioAttendanceStatus19.SelectedValue = "Missing";


            comboPlayer20.SelectedIndex = -1;
            comboAttendanceValue20.SelectedIndex = -1;
            radioAttendanceStatus20.SelectedValue = "Missing";
            #endregion

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void clearAllFields_Click(object sender, EventArgs e)
        {
            comboPlayer1.SelectedIndex = -1;
            comboPlayer2.SelectedIndex = -1;
            comboPlayer3.SelectedIndex = -1;
            comboPlayer4.SelectedIndex = -1;
            comboPlayer5.SelectedIndex = -1;
            comboPlayer6.SelectedIndex = -1;
            comboPlayer7.SelectedIndex = -1;
            comboPlayer8.SelectedIndex = -1;
            comboPlayer9.SelectedIndex = -1;
            comboPlayer10.SelectedIndex = -1;
            comboPlayer11.SelectedIndex = -1;
            comboPlayer12.SelectedIndex = -1;
            comboPlayer13.SelectedIndex = -1;
            comboPlayer14.SelectedIndex = -1;
            comboPlayer15.SelectedIndex = -1;
            comboPlayer16.SelectedIndex = -1;
            comboPlayer17.SelectedIndex = -1;
            comboPlayer18.SelectedIndex = -1;
            comboPlayer19.SelectedIndex = -1;
            comboPlayer20.SelectedIndex = -1;

            comboAttendanceValue1.SelectedIndex = -1;
            comboAttendanceValue2.SelectedIndex = -1;
            comboAttendanceValue3.SelectedIndex = -1;
            comboAttendanceValue4.SelectedIndex = -1;
            comboAttendanceValue5.SelectedIndex = -1;
            comboAttendanceValue6.SelectedIndex = -1;
            comboAttendanceValue7.SelectedIndex = -1;
            comboAttendanceValue8.SelectedIndex = -1;
            comboAttendanceValue9.SelectedIndex = -1;
            comboAttendanceValue10.SelectedIndex = -1;
            comboAttendanceValue11.SelectedIndex = -1;
            comboAttendanceValue12.SelectedIndex = -1;
            comboAttendanceValue13.SelectedIndex = -1;
            comboAttendanceValue14.SelectedIndex = -1;
            comboAttendanceValue15.SelectedIndex = -1;
            comboAttendanceValue16.SelectedIndex = -1;
            comboAttendanceValue17.SelectedIndex = -1;
            comboAttendanceValue18.SelectedIndex = -1;
            comboAttendanceValue19.SelectedIndex = -1;
            comboAttendanceValue20.SelectedIndex = -1;


            radioAttendanceStatus1.SelectedIndex = 0;
            radioAttendanceStatus2.SelectedIndex = 0;
            radioAttendanceStatus3.SelectedIndex = 0;
            radioAttendanceStatus4.SelectedIndex = 0;
            radioAttendanceStatus5.SelectedIndex = 0;
            radioAttendanceStatus6.SelectedIndex = 0;
            radioAttendanceStatus7.SelectedIndex = 0;
            radioAttendanceStatus8.SelectedIndex = 0;
            radioAttendanceStatus9.SelectedIndex = 0;
            radioAttendanceStatus10.SelectedIndex = 0;
            radioAttendanceStatus11.SelectedIndex = 0;
            radioAttendanceStatus12.SelectedIndex = 0;
            radioAttendanceStatus13.SelectedIndex = 0;
            radioAttendanceStatus14.SelectedIndex = 0;
            radioAttendanceStatus15.SelectedIndex = 0;
            radioAttendanceStatus16.SelectedIndex = 0;
            radioAttendanceStatus17.SelectedIndex = 0;
            radioAttendanceStatus18.SelectedIndex = 0;
            radioAttendanceStatus19.SelectedIndex = 0;
            radioAttendanceStatus20.SelectedIndex = 0;
        }

        public DataSet getEntireActiveRoster()
        {
            string getRosterQuery = "SELECT PlayerName FROM Roster WHERE PlayerName <> 'DE' AND IsActive = 1 AND RaidDay = 'Weekday'"; // Ignore Disenchanter player option

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand command = connection.CreateCommand();
            command.CommandText = getRosterQuery;
            da.SelectCommand = command;
            DataSet ds = new DataSet();

            connection.Open();
            da.Fill(ds);

            connection.Close();

            return ds;
        }

        public DataSet getEntireActiveRosterByClass()
        {
            string getRosterQuery = "SELECT PlayerName FROM Roster WHERE PlayerName <> 'DE' AND IsActive = 1 and RaidDay = 'Weekday' order by PlayerClass"; // Ignore Disenchanter player option

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand command = connection.CreateCommand();
            command.CommandText = getRosterQuery;
            da.SelectCommand = command;
            DataSet ds = new DataSet();

            connection.Open();
            da.Fill(ds);

            connection.Close();

            return ds;
        }

        public List<string> getBenchedPlayers()
        {
            List<string> benchedPlayers = new List<string>();
            benchedPlayers.Add(comboPlayer1.SelectedValue);
            benchedPlayers.Add(comboPlayer2.SelectedValue);
            benchedPlayers.Add(comboPlayer3.SelectedValue);
            benchedPlayers.Add(comboPlayer4.SelectedValue);
            benchedPlayers.Add(comboPlayer5.SelectedValue);
            benchedPlayers.Add(comboPlayer6.SelectedValue);
            benchedPlayers.Add(comboPlayer7.SelectedValue);
            benchedPlayers.Add(comboPlayer8.SelectedValue);
            benchedPlayers.Add(comboPlayer9.SelectedValue);
            benchedPlayers.Add(comboPlayer10.SelectedValue);
            benchedPlayers.Add(comboPlayer11.SelectedValue);
            benchedPlayers.Add(comboPlayer12.SelectedValue);
            benchedPlayers.Add(comboPlayer13.SelectedValue);
            benchedPlayers.Add(comboPlayer14.SelectedValue);
            benchedPlayers.Add(comboPlayer15.SelectedValue);
            benchedPlayers.Add(comboPlayer16.SelectedValue);
            benchedPlayers.Add(comboPlayer17.SelectedValue);
            benchedPlayers.Add(comboPlayer18.SelectedValue);
            benchedPlayers.Add(comboPlayer19.SelectedValue);
            benchedPlayers.Add(comboPlayer20.SelectedValue);

            benchedPlayers = benchedPlayers.Where(s => !string.IsNullOrWhiteSpace(s)).ToList();

            return benchedPlayers;
        }

        public bool attendanceEntryAlreadyExists(string playerName, DateTime raidDate)
        {
            string selectRowQuery = "SELECT PlayerName, RaidDate, AttendanceValue, Kara, Gruul, Mag, SSC, TK, Hyjal, BT, SWP FROM Attendance WHERE PlayerName = @PlayerName AND RaidDate = @RaidDate";

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter();

            SqlCommand command = connection.CreateCommand();
            command.Parameters.AddWithValue("PlayerName", playerName);
            command.Parameters.AddWithValue("RaidDate", calendarAttendance.SelectedDate);
            command.CommandText = selectRowQuery;
            da.SelectCommand = command;
            DataSet ds = new DataSet();

            connection.Open();
            da.Fill(ds);
            connection.Close();

            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                DataTable dtPlayersInfo = ds.Tables[0];
                // Get info on raids that are already entered into database for this date
                DataRow firstPlayerRow = dtPlayersInfo.Rows[0];
                bool MCAlreadyExists = (bool)firstPlayerRow["MC"];
                bool OnyAlreadyExists = (bool)firstPlayerRow["Ony"];
                bool BWLAlreadyExists = (bool)firstPlayerRow["BWL"];
                bool AQ40AlreadyExists = (bool)firstPlayerRow["AQ40"];
                bool NaxxAlreadyExists = (bool)firstPlayerRow["Naxx"];

                List<ComboBox> listComboPlayers = new List<ComboBox> { comboPlayer1, comboPlayer2, comboPlayer3, comboPlayer4, comboPlayer5, comboPlayer6, comboPlayer7, comboPlayer8, comboPlayer9, comboPlayer10, comboPlayer11, comboPlayer12, comboPlayer13, comboPlayer14, comboPlayer15, comboPlayer16, comboPlayer17, comboPlayer18, comboPlayer19, comboPlayer20 };
                List<ComboBox> listComboAttendance = new List<ComboBox> { comboAttendanceValue1, comboAttendanceValue2, comboAttendanceValue3, comboAttendanceValue4, comboAttendanceValue5, comboAttendanceValue6, comboAttendanceValue7, comboAttendanceValue8, comboAttendanceValue9, comboAttendanceValue10, comboAttendanceValue11, comboAttendanceValue12, comboAttendanceValue13, comboAttendanceValue14, comboAttendanceValue15, comboAttendanceValue16, comboAttendanceValue17, comboAttendanceValue18, comboAttendanceValue19, comboAttendanceValue20 };
                List<RadioButtonList> listRadioStatus = new List<RadioButtonList> { radioAttendanceStatus1, radioAttendanceStatus2, radioAttendanceStatus3, radioAttendanceStatus4, radioAttendanceStatus5, radioAttendanceStatus6, radioAttendanceStatus7, radioAttendanceStatus8, radioAttendanceStatus9, radioAttendanceStatus10, radioAttendanceStatus11, radioAttendanceStatus12, radioAttendanceStatus13, radioAttendanceStatus14, radioAttendanceStatus15, radioAttendanceStatus16, radioAttendanceStatus17, radioAttendanceStatus18, radioAttendanceStatus19, radioAttendanceStatus20 };

                for (int i = 0; i < listComboPlayers.Count; i++)
                {
                    if (!listComboPlayers[i].SelectedValue.Equals(string.Empty))
                    {
                        string updateExistingAttendanceQuery = "Update Attendance set AttendanceValue = @AttendanceValue, Bench = @Bench where PlayerName = @PlayerName and RaidDate = @RaidDate";
                        connection.Open();
                        command = new SqlCommand(updateExistingAttendanceQuery, connection);
                        command.Parameters.AddWithValue("@PlayerName", listComboPlayers[i].SelectedValue);
                        command.Parameters.AddWithValue("@RaidDate", firstPlayerRow["RaidDate"]);
                        command.Parameters.AddWithValue("@AttendanceValue", listComboAttendance[i].SelectedValue);
                        command.Parameters.AddWithValue("@Bench", listRadioStatus[i].SelectedValue);

                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }

                List<string> raidList = new List<string>();
                foreach (ListItem item in CheckBoxRaids.Items)
                {
                    if (item.Selected)
                    {
                        raidList.Add(item.ToString());
                    }
                }

                int MCselected = 0;
                int Onyselected = 0;
                int BWLselected = 0;
                int AQ40selected = 0;
                int Naxxselected = 0;

                if (raidList.Contains("MC")) MCselected = 1;
                if (raidList.Contains("Ony")) Onyselected = 1;
                if (raidList.Contains("BWL")) BWLselected = 1;
                if (raidList.Contains("AQ40")) AQ40selected = 1;
                if (raidList.Contains("Naxx")) Naxxselected = 1;

                string dateThing = raidDate.ToString("yyyy-MM-dd");

                string updateRaidListForSelectedDate = "Update Attendance set MC = @MC, Ony = @Ony, BWL = @BWL, AQ40 = @AQ40, Naxx = @Naxx where RaidDate = '" + dateThing + "'";
                connection.Open();
                command = new SqlCommand(updateRaidListForSelectedDate, connection);
                command.Parameters.AddWithValue("@MC", MCselected == 1 || MCAlreadyExists ? 1 : 0);
                command.Parameters.AddWithValue("@Ony", Onyselected == 1 || OnyAlreadyExists ? 1 : 0);
                command.Parameters.AddWithValue("@BWL", BWLselected == 1 || BWLAlreadyExists ? 1 : 0);
                command.Parameters.AddWithValue("@AQ40", AQ40selected == 1 || AQ40AlreadyExists ? 1 : 0);
                command.Parameters.AddWithValue("@Naxx", Naxxselected == 1 || NaxxAlreadyExists ? 1 : 0);
                command.ExecuteNonQuery();
                connection.Close();

                return true;
            }
        }

        public void InsertPlayerAttendanceQuery(string playerName, string attendanceValue, string attendanceStatus)
        {
            attendanceStatus = attendanceStatus.Equals("No Note") ? "" : attendanceStatus;
            if (attendanceStatus.Equals("Standby"))
            {
                attendanceValue = !attendanceValue.Equals("") ? attendanceValue : "1";
            }
            else
            {
                attendanceValue = attendanceValue.Equals("") ? "0" : attendanceValue;
            }
            if (playerName == null || playerName.Equals(string.Empty) || attendanceValue == null || attendanceValue.Equals(string.Empty))
            {
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            List<string> raidList = new List<string>();
            foreach (ListItem item in CheckBoxRaids.Items)
            {
                if (item.Selected)
                {
                    raidList.Add(item.ToString());
                }
            }

            int Kara = 0;
            int Gruul = 0;
            int Mag = 0;
            int SSC = 0;
            int TK = 0;
            int Hyjal = 0;
            int BT = 0;
            int SWP = 0;

            if (raidList.Contains("Kara")) Kara = 1;
            if (raidList.Contains("Gruul")) Gruul = 1;
            if (raidList.Contains("Mag")) Mag = 1;
            if (raidList.Contains("SSC")) SSC = 1;
            if (raidList.Contains("TK")) TK = 1;
            if (raidList.Contains("Hyjal")) Hyjal = 1;
            if (raidList.Contains("BT")) TK = 1;
            if (raidList.Contains("SWP")) TK = 1;

            if (attendanceEntryAlreadyExists(playerName, calendarAttendance.SelectedDate))
            {
                //labelErrorRaidAlreadyExists.Visible = true;

                return;
            }

            string insertPlayerAttendanceQuery = "INSERT INTO Attendance (PlayerName, RaidDate, WeekdayName, AttendanceValue, Bench, Kara, Gruul, Mag, SSC, TK, Hyjal, BT, SWP) " +
                                                                "VALUES   (@PlayerName, @RaidDate, @WeekdayName, @AttendanceValue, @Bench, @Kara, @Mag, @SSC, @TK, @Hyjal, @BT, @SWP)";

            connection.Open();

            SqlCommand command = new SqlCommand(insertPlayerAttendanceQuery, connection);

            string RaidDate = calendarAttendance.SelectedDate.ToString("yyyy-MM-dd");
            string WeekdayName = calendarAttendance.SelectedDate.DayOfWeek.ToString();

            command.Parameters.AddWithValue("@PlayerName", playerName);
            command.Parameters.AddWithValue("@RaidDate", RaidDate);
            command.Parameters.AddWithValue("@WeekdayName", WeekdayName);
            command.Parameters.AddWithValue("@AttendanceValue", attendanceValue);
            command.Parameters.AddWithValue("@Bench", attendanceStatus);
            command.Parameters.AddWithValue("@Kara", Kara);
            command.Parameters.AddWithValue("@Gruul", Gruul);
            command.Parameters.AddWithValue("@Mag", Mag);
            command.Parameters.AddWithValue("@SSC", SSC);
            command.Parameters.AddWithValue("@TK", TK);
            command.Parameters.AddWithValue("@Hyjal", Hyjal);
            command.Parameters.AddWithValue("@BT", BT);
            command.Parameters.AddWithValue("@SWP", SWP);

            command.ExecuteNonQuery();

            // Update RaidsAttended column in [Roster] table
            string updateRaidsAttendedQuery = "UPDATE Roster SET RaidsAttended = RaidsAttended + @AttendanceValue WHERE PlayerName = @PlayerName";
            command = new SqlCommand(updateRaidsAttendedQuery, connection);

            command.Parameters.AddWithValue("@AttendanceValue", attendanceValue);
            command.Parameters.AddWithValue("@PlayerName", playerName);

            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void CheckBoxRaids_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubmitNewRaid.Enabled = true;
            SubmitNewRaid.ToolTip = "";

            UpdateExistingRaid.Enabled = true;
            UpdateExistingRaid.ToolTip = "";
        }

        protected void DeleteAndOverwriteExistingRaid_Click(object sender, EventArgs e)
        {
            labelErrorRaidAlreadyExists.Visible = false;

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = connection.CreateCommand();

            string checkIfRaidDateExistsQuery = "SELECT distinct RaidDate from Attendance WHERE RaidDate = @RaidDate";
            SqlDataAdapter da = new SqlDataAdapter();
            command.CommandText = checkIfRaidDateExistsQuery;
            command.Parameters.AddWithValue("RaidDate", calendarAttendance.SelectedDate);
            da.SelectCommand = command;
            DataSet ds = new DataSet();
            connection.Open();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                // did not find an existing raid  
                return;
            }

            string deleteExistingRaidsQuery = "DELETE from Attendance WHERE RaidDate = @RaidDate";
            command = new SqlCommand(deleteExistingRaidsQuery, connection);

            command.Parameters.AddWithValue("@RaidDate", calendarAttendance.SelectedDate);
            command.ExecuteNonQuery();


            InsertPlayerAttendanceQuery(comboPlayer1.SelectedValue, comboAttendanceValue1.SelectedValue, radioAttendanceStatus1.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer2.SelectedValue, comboAttendanceValue2.SelectedValue, radioAttendanceStatus2.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer3.SelectedValue, comboAttendanceValue3.SelectedValue, radioAttendanceStatus3.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer4.SelectedValue, comboAttendanceValue4.SelectedValue, radioAttendanceStatus4.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer5.SelectedValue, comboAttendanceValue5.SelectedValue, radioAttendanceStatus5.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer6.SelectedValue, comboAttendanceValue6.SelectedValue, radioAttendanceStatus6.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer7.SelectedValue, comboAttendanceValue7.SelectedValue, radioAttendanceStatus7.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer8.SelectedValue, comboAttendanceValue8.SelectedValue, radioAttendanceStatus8.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer9.SelectedValue, comboAttendanceValue9.SelectedValue, radioAttendanceStatus9.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer10.SelectedValue, comboAttendanceValue10.SelectedValue, radioAttendanceStatus10.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer11.SelectedValue, comboAttendanceValue11.SelectedValue, radioAttendanceStatus11.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer12.SelectedValue, comboAttendanceValue12.SelectedValue, radioAttendanceStatus12.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer13.SelectedValue, comboAttendanceValue13.SelectedValue, radioAttendanceStatus13.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer14.SelectedValue, comboAttendanceValue14.SelectedValue, radioAttendanceStatus14.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer15.SelectedValue, comboAttendanceValue15.SelectedValue, radioAttendanceStatus15.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer16.SelectedValue, comboAttendanceValue16.SelectedValue, radioAttendanceStatus16.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer17.SelectedValue, comboAttendanceValue17.SelectedValue, radioAttendanceStatus17.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer18.SelectedValue, comboAttendanceValue18.SelectedValue, radioAttendanceStatus18.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer19.SelectedValue, comboAttendanceValue19.SelectedValue, radioAttendanceStatus19.SelectedValue);
            InsertPlayerAttendanceQuery(comboPlayer20.SelectedValue, comboAttendanceValue20.SelectedValue, radioAttendanceStatus20.SelectedValue);

            List<string> benchedPlayers = getBenchedPlayers();
            DataSet entireRaidRoster = getEntireActiveRoster();
            List<DataRow> rowsToDelete = new List<DataRow>();
            foreach (DataRow row in entireRaidRoster.Tables[0].Rows)
            {
                if (benchedPlayers.Contains(row["PlayerName"]))
                {
                    rowsToDelete.Add(row);
                }
            }

            foreach (DataRow row in rowsToDelete)
            {
                entireRaidRoster.Tables[0].Rows.Remove(row);
            }

            List<string> remainingRosterToSubmit = new List<string>();

            foreach (DataRow row in entireRaidRoster.Tables[0].Rows)
            {
                remainingRosterToSubmit.Add(row["PlayerName"].ToString());
            }

            foreach (string playerName in remainingRosterToSubmit)
            {
                InsertPlayerAttendanceQuery(playerName, "1.00", "");
            }

            #region Reset Textboxes
            CheckBoxRaids.SelectedIndex = -1;

            comboPlayer1.SelectedIndex = -1;
            comboAttendanceValue1.SelectedIndex = -1;
            radioAttendanceStatus1.SelectedValue = "Missing";

            comboPlayer2.SelectedIndex = -1;
            comboAttendanceValue2.SelectedIndex = -1;
            radioAttendanceStatus2.SelectedValue = "Missing";

            comboPlayer3.SelectedIndex = -1;
            comboAttendanceValue3.SelectedIndex = -1;
            radioAttendanceStatus3.SelectedValue = "Missing";

            comboPlayer4.SelectedIndex = -1;
            comboAttendanceValue4.SelectedIndex = -1;
            radioAttendanceStatus4.SelectedValue = "Missing";

            comboPlayer5.SelectedIndex = -1;
            comboAttendanceValue5.SelectedIndex = -1;
            radioAttendanceStatus5.SelectedValue = "Missing";

            comboPlayer6.SelectedIndex = -1;
            comboAttendanceValue6.SelectedIndex = -1;
            radioAttendanceStatus6.SelectedValue = "Missing";

            comboPlayer7.SelectedIndex = -1;
            comboAttendanceValue7.SelectedIndex = -1;
            radioAttendanceStatus7.SelectedValue = "Missing";

            comboPlayer8.SelectedIndex = -1;
            comboAttendanceValue8.SelectedIndex = -1;
            radioAttendanceStatus8.SelectedValue = "Missing";

            comboPlayer9.SelectedIndex = -1;
            comboAttendanceValue9.SelectedIndex = -1;
            radioAttendanceStatus9.SelectedValue = "Missing";

            comboPlayer10.SelectedIndex = -1;
            comboAttendanceValue10.SelectedIndex = -1;
            radioAttendanceStatus10.SelectedValue = "Missing";


            comboPlayer10.SelectedIndex = -1;
            comboAttendanceValue10.SelectedIndex = -1;
            radioAttendanceStatus10.SelectedValue = "Missing";


            comboPlayer11.SelectedIndex = -1;
            comboAttendanceValue11.SelectedIndex = -1;
            radioAttendanceStatus12.SelectedValue = "Missing";


            comboPlayer12.SelectedIndex = -1;
            comboAttendanceValue12.SelectedIndex = -1;
            radioAttendanceStatus12.SelectedValue = "Missing";


            comboPlayer13.SelectedIndex = -1;
            comboAttendanceValue13.SelectedIndex = -1;
            radioAttendanceStatus13.SelectedValue = "Missing";


            comboPlayer14.SelectedIndex = -1;
            comboAttendanceValue14.SelectedIndex = -1;
            radioAttendanceStatus14.SelectedValue = "Missing";


            comboPlayer15.SelectedIndex = -1;
            comboAttendanceValue15.SelectedIndex = -1;
            radioAttendanceStatus15.SelectedValue = "Missing";


            comboPlayer16.SelectedIndex = -1;
            comboAttendanceValue16.SelectedIndex = -1;
            radioAttendanceStatus16.SelectedValue = "Missing";


            comboPlayer17.SelectedIndex = -1;
            comboAttendanceValue17.SelectedIndex = -1;
            radioAttendanceStatus17.SelectedValue = "Missing";


            comboPlayer18.SelectedIndex = -1;
            comboAttendanceValue18.SelectedIndex = -1;
            radioAttendanceStatus18.SelectedValue = "Missing";


            comboPlayer19.SelectedIndex = -1;
            comboAttendanceValue19.SelectedIndex = -1;
            radioAttendanceStatus19.SelectedValue = "Missing";


            comboPlayer20.SelectedIndex = -1;
            comboAttendanceValue20.SelectedIndex = -1;
            radioAttendanceStatus20.SelectedValue = "Missing";

            #endregion

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void calendarAttendance_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarAttendance, labelRaidsRun);
        }

        protected void deleteRaidsOnSelectedDate_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = connection.CreateCommand();

            string deleteExistingRaidsQuery = "DELETE from Attendance WHERE RaidDate = @RaidDate";
            command = new SqlCommand(deleteExistingRaidsQuery, connection);

            command.Parameters.AddWithValue("@RaidDate", calendarAttendance.SelectedDate);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }        
    }
}