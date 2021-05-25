<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="TK.aspx.cs" Inherits="WebApplication5.TK" %>
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
    <asp:SqlDataSource ID="VoidReaverLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Void Reaver')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="AlarLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Alar')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SolarianLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Solarian')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="KaelthasLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Kaelthas')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TKTrashLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Trash' AND RaidName = 'TK')"></asp:SqlDataSource>
    <br /><br /><br /><br />

    <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of TK Raid</b></asp:Label>
    <asp:Calendar ID="calendarTK" runat="server" OnSelectionChanged="calendarTK_SelectionChanged"></asp:Calendar>
    <br /><asp:Label ID="labelRaidsRun" runat="server" Text="Label" Class="bold"></asp:Label>

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
    <h1>Void Reaver</h1>
    <br />

    <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>
    <ajaxToolkit:ComboBox ID="comboVoidReaverLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="VoidReaverLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboVoidReaverPlayer1" runat="server" Class="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioVoidReaver1"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxVoidReaver1" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboVoidReaverLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="VoidReaverLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboVoidReaverPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioVoidReaver2" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxVoidReaver2" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboVoidReaverLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="VoidReaverLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboVoidReaverPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioVoidReaver3" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxVoidReaver3" Class="inlineBlock" runat="server" text="Sidegrade"/>

    <br />

    <br />
    <h1>Al'ar</h1>

    <ajaxToolkit:ComboBox ID="comboAlarLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AlarLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboAlarPlayer1" runat="server" Class="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAlar1"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAlar1" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboAlarLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AlarLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAlarPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAlar2" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAlar2" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboAlarLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AlarLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAlarPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAlar3" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAlar3" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br />
    <h1>High Astromancer Solarian</h1>

    <ajaxToolkit:ComboBox ID="comboSolarianLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SolarianLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboSolarianPlayer1" runat="server" Class="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioSolarian1"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSolarian1" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboSolarianLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SolarianLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboSolarianPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioSolarian2" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSolarian2" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboSolarianLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SolarianLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboSolarianPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioSolarian3" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSolarian3" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br />
    <h1>Kael'thas Sunstrider</h1>

    <ajaxToolkit:ComboBox ID="comboKaelthasLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaelthasLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboKaelthasPlayer1" runat="server" Class="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKaelthas1"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKaelthas1" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboKaelthasLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaelthasLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboKaelthasPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKaelthas2" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKaelthas2" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboKaelthasLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaelthasLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboKaelthasPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKaelthas3" RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKaelthas3" Class="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br /> <br />
    
    <h1>Trash</h1>

    <ajaxToolkit:ComboBox ID="comboTrashLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash1"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash1" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash2"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash2" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash3"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash3" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash4"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash4" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash5"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash5" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash6"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash6" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash7"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash7" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash8"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash8" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash9"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash9" Class="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TKTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash10"  RepeatDirection="Horizontal" Class="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash10" Class="inlineBlock" runat="server" text="Sidegrade"/> 
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