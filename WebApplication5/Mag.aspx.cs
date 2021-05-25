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
    public partial class Mag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                calendarMag.SelectedDate = DateTime.Today;
                getPlayersWithMagBag();
                Utility.getRaidsForSelectedDate(calendarMag, labelRaidsRun);
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

        public void getPlayersWithMagBag()
        {
            string getRosterQuery = "select PlayerName from PlayerLoot where ItemName = 'Pitch Lord''s Satchel'";

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand command = connection.CreateCommand();
            command.CommandText = getRosterQuery;
            da.SelectCommand = command;
            DataTable dt = new DataTable();

            connection.Open();
            da.Fill(dt);
            connection.Close();

            List<string> listPlayersWithMagBag = new List<string>();

            foreach (DataRow playerName in dt.Rows)
            {
                string player = playerName["PlayerName"].ToString();
                //labelHasOnyBag.Text = labelHasOnyBag.Text + itemName + ", ";
                listPlayersWithMagBag.Add(player);
            }

            string[] arrayPlayersWithMagBag = listPlayersWithMagBag.ToArray();
            string allPlayersWithMagBag = string.Join(", ", arrayPlayersWithMagBag.Where(s => !string.IsNullOrEmpty(s)));
            labelHasMagBag.Text = allPlayersWithMagBag;
        }

        protected void WriteToDatabase_Click(object sender, EventArgs e)
        {
            string dateOfRaid = calendarMag.SelectedDate.ToString("yyyy-MM-dd");

            Utility.InsertPlayerlootQuery(comboMagPlayer1.SelectedValue, comboMagLoot1.SelectedValue, radioMag1.SelectedValue, dateOfRaid, checkboxMag1.Checked);
            Utility.InsertPlayerlootQuery(comboMagPlayer2.SelectedValue, comboMagLoot2.SelectedValue, radioMag2.SelectedValue, dateOfRaid, checkboxMag2.Checked);
            Utility.InsertPlayerlootQuery(comboMagPlayer3.SelectedValue, comboMagLoot3.SelectedValue, radioMag3.SelectedValue, dateOfRaid, checkboxMag3.Checked);
            Utility.InsertPlayerlootQuery(comboMagPlayer4.SelectedValue, comboMagLoot4.SelectedValue, radioMag4.SelectedValue, dateOfRaid, checkboxMag4.Checked);
            Utility.InsertPlayerlootQuery(comboMagPlayer5.SelectedValue, comboMagLoot5.SelectedValue, radioMag5.SelectedValue, dateOfRaid, checkboxMag5.Checked);
            Utility.InsertPlayerlootQuery(comboMagPlayer6.SelectedValue, comboMagLoot6.SelectedValue, radioMag6.SelectedValue, dateOfRaid, checkboxMag6.Checked);
        }

        protected void calendarMag_SelectionChanged(object sender, EventArgs e)
        {
            Utility.getRaidsForSelectedDate(calendarMag, labelRaidsRun);
        }
    }
}