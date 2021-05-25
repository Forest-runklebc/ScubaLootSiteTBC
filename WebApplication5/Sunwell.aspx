<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Sunwell.aspx.cs" Inherits="WebApplication5.Sunwell" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>




<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>var whTooltips = { colorLinks: true, iconizeLinks: true, renameLinks: true };</script>
    <script src="http://wow.zamimg.com/widgets/power.js"></script>
<%--    <a href="https://classic.wowhead.com/item=22589&amp;lvl=80" class="q5">Atiesh, Greatstaff of the Guardian</a> <small>(Level 80 conversions)</small><br />--%>

    
     <style type="text/css">
        .inlineBlock { display: inline-block; }

        .bold
        {
          font-weight:bold;
        }
    </style>

            <asp:SqlDataSource ID="Roster" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT PlayerName FROM Roster WHERE IsActive = 1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="KalecgosLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Kalecgos')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="BrutallusLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Brutallus')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="FelmystLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Felmyst')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="TwinsLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Twins')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="MuruLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Muru')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="KiljaedenLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Kiljaeden')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SunwellTrashLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Trash' AND RaidName = 'SWP')"></asp:SqlDataSource>
            <br /><br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of Sunwell Raid</b></asp:Label>
            <asp:Calendar ID="calendarSunwell" runat="server" OnSelectionChanged="calendarSunwell_SelectionChanged"></asp:Calendar>
            <br /><asp:Label ID="labelRaidsRun" runat="server" Text="Label" CssClass="bold"></asp:Label>
            
<div>
   <h4>Select a file to upload:</h4>

   <asp:FileUpload id="FileUpload1"                 
       runat="server">
   </asp:FileUpload>

   <br /><br />

   <asp:Button id="UploadButton" 
       Text="Upload file"
       OnClick="UploadButton_Click"
       runat="server">
   </asp:Button>    

   <hr />

   <asp:Label id="UploadStatusLabel"
       runat="server">
   </asp:Label>        
</div>
            
            <br />
            <h1>Kalecgos & Sathrovarr</h1>
            <br />
            <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>

            <ajaxToolkit:ComboBox ID="comboKalecgosLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KalecgosLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>            
            <ajaxToolkit:ComboBox ID="comboKalecgosPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioKalecgos1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKalecgos1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboKalecgosLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KalecgosLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboKalecgosPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioKalecgos2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKalecgos2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />            <br />
            <h1>Brutallus</h1>

            <ajaxToolkit:ComboBox ID="comboBrutallusLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BrutallusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboBrutallusPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioBrutallus1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxBrutallus1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboBrutallusLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BrutallusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboBrutallusPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioBrutallus2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxBrutallus2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboBrutallusLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BrutallusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboBrutallusPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioBrutallus3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxBrutallus3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
            <h1>Felmyst</h1>
            <ajaxToolkit:ComboBox ID="comboFelmystLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="FelmystLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboFelmystPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioFelmyst1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxFelmyst1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboFelmystLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="FelmystLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboFelmystPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioFelmyst2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxFelmyst2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />            <br />
            <h1>Eredar Twins</h1>

            <ajaxToolkit:ComboBox ID="comboTwinsLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TwinsLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTwinsPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTwins1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTwins1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTwinsLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TwinsLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTwinsPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTwins2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTwins2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTwinsLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TwinsLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTwinsPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTwins3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTwins3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTwinsLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TwinsLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTwinsPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTwins4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTwins4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />

                <br />            <br />
                <h1>M'uru</h1>
            <ajaxToolkit:ComboBox ID="comboMuruLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MuruLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMuruPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMuru1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMuru1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboMuruLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MuruLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMuruPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMuru2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMuru2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboMuruLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MuruLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMuruPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioMuru3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMuru3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />

                <br />            <br />
                <h1>Kil'jaeden</h1>

            <ajaxToolkit:ComboBox ID="comboKiljaedenLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KiljaedenLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboKiljaedenPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioKiljaeden1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKiljaeden1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboKiljaedenLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KiljaedenLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboKiljaedenPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioKiljaeden2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKiljaeden2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
               
                <br />            <br />
                <h1>Trash</h1>

            <ajaxToolkit:ComboBox ID="comboTrashLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash5"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash5" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash6"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash6" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash7"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash7" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash8"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash8" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash9"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash9" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SunwellTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash10"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash10" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />

            <br />
            <asp:Button ID="WriteToDatabase" runat="server" Text="Write to Database" onClientClick="return confirm('Really write to database?')" OnClick="WriteToDatabase_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
</asp:Content>