using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;

namespace WebApplication5
{
    public partial class Login : System.Web.UI.Page
    {
        private static int saltLengthLimit = 32;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                labelError.Visible = false;
            }
            // InsertUserIntoDatabase("scubacops", "Sappersahoy123!");
            //byte[] randomSalt = GetSalt(saltLengthLimit);
            //string randomSaltAsString = Encoding.ASCII.GetString(randomSalt);

            //byte[] bytePassword = Encoding.ASCII.GetBytes(password);
            //string bytePasswordAsString = Encoding.ASCII.GetString(bytePassword);

            //byte[] saltedHash = GenerateSaltedHash(bytePassword, randomSalt);
            //string saltedHashAsString = Encoding.ASCII.GetString(saltedHash);

            //bool testLogin = AuthenticateUser("scubacops", "Sappersahoy123!");

            int x = 5;
        }

        public static bool AuthenticateUser(string userName, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string userInfoQuery = "SELECT UserSalt, SaltedHash from LoginInfo WHERE UserName = '" + userName + "'";

            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand command = connection.CreateCommand();
            command.CommandText = userInfoQuery;
            da.SelectCommand = command;
            DataSet ds = new DataSet();

            da.Fill(ds);
            connection.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                byte[] bytePassword = Encoding.ASCII.GetBytes(password);
                byte[] userSalt = (byte[])ds.Tables[0].Rows[0]["UserSalt"];

                byte[] attemptedSaltedHash = GenerateSaltedHash(bytePassword, userSalt);
                byte[] correctSaltedHash = (byte[])ds.Tables[0].Rows[0]["SaltedHash"];

                bool authenticationSuccessful = CompareByteArrays(attemptedSaltedHash, correctSaltedHash);

                return authenticationSuccessful;
            }
            else
            {
                return false;
            }
        }

        public static void InsertUserIntoDatabase(string userName, string password)
        {
            byte[] bytePassword = Encoding.ASCII.GetBytes(password);

            byte[] randomSalt = GetSalt(saltLengthLimit);
            // string randomSaltAsString = Encoding.ASCII.GetString(randomSalt);

            byte[] saltedHash = GenerateSaltedHash(bytePassword, randomSalt);
            //string saltedHashAsString = Encoding.ASCII.GetString(saltedHash);

            string insertUserIntoDatabase = "INSERT INTO LoginInfo (UserName, UserSalt, SaltedHash) " +
                                                        "VALUES   (@UserName, @UserSalt, @SaltedHash)";

            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand command = new SqlCommand(insertUserIntoDatabase, connection);

            command.Parameters.AddWithValue("@UserName", userName);
            SqlParameter userSaltParam = command.Parameters.Add("@UserSalt", SqlDbType.VarBinary);
            userSaltParam.Value = randomSalt;
            SqlParameter saltedHashParam = command.Parameters.Add("@SaltedHash", SqlDbType.VarBinary);
            saltedHashParam.Value = saltedHash;

            command.ExecuteNonQuery();
            connection.Close();
        }

        static byte[] GenerateSaltedHash(byte[] plainText, byte[] salt)
        {
            HashAlgorithm algorithm = new SHA256Managed();

            byte[] plainTextWithSaltBytes = new byte[plainText.Length + salt.Length];

            for (int i = 0; i < plainText.Length; i++)
            {
                plainTextWithSaltBytes[i] = plainText[i];
            }

            for (int i = 0; i < salt.Length; i++)
            {
                plainTextWithSaltBytes[plainText.Length + i] = salt[i];
            }

            return algorithm.ComputeHash(plainTextWithSaltBytes);
        }

        public static bool CompareByteArrays(byte[] array1, byte[] array2)
        {
            if (array1.Length != array2.Length)
            {
                return false;
            }

            for (int i = 0; i < array1.Length; i++)
            {
                if (array1[i] != array2[i])
                {
                    return false;
                }
            }

            return true;
        }

        private static byte[] GetSalt()
        {
            return GetSalt(saltLengthLimit);
        }

        private static byte[] GetSalt(int maximumSaltLength)
        {
            var salt = new byte[maximumSaltLength];
            using (var random = new RNGCryptoServiceProvider())
            {
                random.GetNonZeroBytes(salt);
            }

            return salt;
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string username = TextBoxUsername.Text.Trim();
            string password = TextBoxPassword.Text.Trim();

            bool allowLogin = AuthenticateUser(username, password);

            if (!allowLogin)
            {
                labelError.Visible = true;
            }
            else
            {
                SessionUserID = username;
                Response.Redirect("~/");
            }
            string insertLoginLogs = "INSERT INTO LoginLogs (LoginName, LoginTime) " +
                                            "VALUES   (@LoginName, @LoginTime)";
            string connectionString = ConfigurationManager.ConnectionStrings["BLAKE"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand command = new SqlCommand(insertLoginLogs, connection);

            command.Parameters.AddWithValue("@UserName", username);
            command.Parameters.AddWithValue("@LoginTime", DateTime.Now);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static string SessionUserID
        {
            get
            {
                object value = HttpContext.Current.Session["SessionUserID"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["SessionUserID"] = value;
            }
        }
    }
}