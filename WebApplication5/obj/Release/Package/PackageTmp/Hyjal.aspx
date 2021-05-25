<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Hyjal.aspx.cs" Inherits="WebApplication5.Hyjal" %>
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
    <asp:SqlDataSource ID="WinterchillLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Winterchill')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="AnetheronLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Anetheron')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="KazrogalLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Kazrogal')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="AzgalorLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Azgalor')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ArchimondeLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Archimonde')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="HyjalTrashLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Trash' AND RaidName = 'Hyjal')"></asp:SqlDataSource>
    <br /><br /><br /><br />

    <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of Hyjal Raid</b></asp:Label>
    <asp:Calendar ID="calendarHyjal" runat="server" OnSelectionChanged="calendarHyjal_SelectionChanged"></asp:Calendar>
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
    <h1>Rage Winterchill</h1>
    <br />

    <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>
    <ajaxToolkit:ComboBox ID="comboWinterchillLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="WinterchillLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboWinterchillPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioWinterchill1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxWinterchill1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboWinterchillLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="WinterchillLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboWinterchillPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioWinterchill2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxWinterchill2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboWinterchillLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="WinterchillLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboWinterchillPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioWinterchill3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxWinterchill3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>

    <br />

    <br />
    <h1>Anetheron</h1>

    <ajaxToolkit:ComboBox ID="comboAnetheronLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AnetheronLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboAnetheronPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAnetheron1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAnetheron1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboAnetheronLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AnetheronLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAnetheronPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAnetheron2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAnetheron2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboAnetheronLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AnetheronLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAnetheronPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAnetheron3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAnetheron3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br />
    <h1>Kaz'rogal</h1>

    <ajaxToolkit:ComboBox ID="comboKazrogalLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KazrogalLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboKazrogalPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKazrogal1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKazrogal1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboKazrogalLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KazrogalLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboKazrogalPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKazrogal2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKazrogal2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboKazrogalLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KazrogalLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboKazrogalPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKazrogal3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKazrogal3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br />
    <h1>Azgalor</h1>

    <ajaxToolkit:ComboBox ID="comboAzgalorLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AzgalorLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboAzgalorPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAzgalor1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAzgalor1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboAzgalorLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AzgalorLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAzgalorPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAzgalor2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAzgalor2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboAzgalorLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AzgalorLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAzgalorPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAzgalor3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAzgalor3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br /> <br />
    <h1>Archimonde</h1>

    <ajaxToolkit:ComboBox ID="comboArchimondeLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ArchimondeLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboArchimondePlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioArchimonde1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxArchimonde1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboArchimondeLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ArchimondeLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboArchimondePlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioArchimonde2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxArchimonde2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboArchimondeLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ArchimondeLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboArchimondePlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioArchimonde3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxArchimonde3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboArchimondeLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ArchimondeLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboArchimondePlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioArchimonde4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList> 
    <asp:CheckBox ID="checkboxArchimonde4" CssClass="inlineBlock" runat="server" text="Sidegrade"/>   


        <br /><br />
    
            <br />              <br />  
    <h1>Trash</h1>

    <ajaxToolkit:ComboBox ID="comboTrashLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash4" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash5"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash5" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash6"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash6" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash7"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash7" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash8"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash8" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash9"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash9" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HyjalTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash10"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash10" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
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