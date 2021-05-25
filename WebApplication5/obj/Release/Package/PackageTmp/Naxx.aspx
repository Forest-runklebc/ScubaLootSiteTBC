<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Naxx.aspx.cs" Inherits="WebApplication5.Naxx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>var whTooltips = { colorLinks: true, iconizeLinks: true, renameLinks: true };</script>
    <script src="http://wow.zamimg.com/widgets/power.js"></script>

    <%--<a href="https://classic.wowhead.com/item=22589&amp;lvl=80" class="q5">Atiesh, Greatstaff of the Guardian</a> <small>(Level 80 conversions)</small><br />--%>

    <a href="#SpiderWing">#Spider</a><br />
    <a href="#PlagueWing">#Plague</a><br />
    <a href="#AbomWing">#Abom</a><br />
    <a href="#MilitaryWing">#Military</a><br />
    <a href="#FrostwyrmLair">#Frostwyrm</a><br />
    <a href="#NaxxTrash">#NaxxTrash</a><br />

     <style type="text/css">
        .inlineBlock { display: inline-block; }

        
        .bold
        {
          font-weight:bold;
        }
    </style>

    <asp:SqlDataSource ID="Roster" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT PlayerName FROM Roster WHERE IsActive = 1"></asp:SqlDataSource>
    <asp:SqlDataSource ID="AnubLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'AnubRekhan')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="FaerlinaLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Faerlina')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="MaexxnaLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Maexxna')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="PatchwerkLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Patchwerk')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="GrobbulusLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Grobbulus')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="GluthLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Gluth')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ThaddiusLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Thaddius')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="NothLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Noth')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="HeiganLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Heigan')"></asp:SqlDataSource>
	<asp:SqlDataSource ID="LoathebLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Loatheb')"></asp:SqlDataSource>
	<asp:SqlDataSource ID="RazuviousLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Razuvious')"></asp:SqlDataSource>
	<asp:SqlDataSource ID="GothikLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Gothik')"></asp:SqlDataSource>
	<asp:SqlDataSource ID="HorseLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = '4Horse')"></asp:SqlDataSource>
	<asp:SqlDataSource ID="SapphironLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Sapphiron')"></asp:SqlDataSource>
	<asp:SqlDataSource ID="KelThuzadLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Kelthuzad')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="NaxxTrashLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Trash' AND RaidName = 'Naxx')"></asp:SqlDataSource>
    <br />

    <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of Naxx Raid</b></asp:Label>
    <asp:Calendar ID="calendarNaxx" runat="server" OnSelectionChanged="calendarNaxx_SelectionChanged"></asp:Calendar>
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

    <a href="SpiderWing"></a>
    <p id="SpiderWing"></>
    <p></p><br />
    <p></p><br />
    <center><h1><u>SPIDER WING</u></h1></center>
    <br /> <br />
    <h1>Anuh'Rekhan</h1>

    <ajaxToolkit:ComboBox ID="comboAnubLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AnubLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboAnubPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAnub1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAnub1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboAnubLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AnubLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAnubPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAnub2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
        <asp:CheckBox ID="checkboxAnub2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboAnubLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AnubLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboAnubPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioAnub3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
        <asp:CheckBox ID="checkboxAnub3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>   
    <br />

    <br /> <br />
    <h1>Grand Widow Faerlina</h1>

    <ajaxToolkit:ComboBox ID="comboFaerlinaLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="FaerlinaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboFaerlinaPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioFaerlina1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
        <asp:CheckBox ID="checkboxFaerlina1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboFaerlinaLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="FaerlinaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboFaerlinaPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioFaerlina2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
        <asp:CheckBox ID="checkboxFaerlina2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboFaerlinaLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="FaerlinaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboFaerlinaPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioFaerlina3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
        <asp:CheckBox ID="checkboxFaerlina3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

    <br /> <br />
    <h1>Maexxna</h1>

    <ajaxToolkit:ComboBox ID="comboMaexxnaLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaexxnaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboMaexxnaPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMaexxna1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMaexxna1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboMaexxnaLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaexxnaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboMaexxnaPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMaexxna2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMaexxna2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboMaexxnaLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaexxnaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboMaexxnaPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMaexxna3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxMaexxna3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboMaexxnaLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaexxnaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboMaexxnaPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMaexxna4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList> 
    <asp:CheckBox ID="checkboxMaexxna4" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 

    <br /> <br />
    <a href="PlagueWing"></a>
    <p id="PlagueWing"></>
    <p></p><br />
    <p></p><br />
    <center><h1 ><u>PLAGUE WING</u></h1></center>
       <br /> <br />
    <h1>Noth The Plaguebringer</h1>

    <ajaxToolkit:ComboBox ID="comboNothLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NothLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboNothPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioNoth1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNoth1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboNothLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NothLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNothPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioNoth2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNoth2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboNothLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NothLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNothPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioNoth3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxNoth3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

        <br /> <br />
    <h1>Heigan The Unclean</h1>

    <ajaxToolkit:ComboBox ID="comboHeiganLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HeiganLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboHeiganPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHeigan1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHeigan1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboHeiganLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HeiganLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboHeiganPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHeigan2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHeigan2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboHeiganLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HeiganLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboHeiganPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHeigan3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxHeigan3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 

        <br /> <br />
    <h1>Loatheb</h1>

    <ajaxToolkit:ComboBox ID="comboLoathebLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LoathebLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboLoathebPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLoatheb1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLoatheb1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboLoathebLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LoathebLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboLoathebPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLoatheb2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLoatheb2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboLoathebLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LoathebLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboLoathebPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLoatheb3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxLoatheb3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboLoathebLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LoathebLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboLoathebPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLoatheb4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLoatheb4" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 

    <a href="Abom"></a>
    <p id="AbomWing"></>
    <p></p><br />
    <p></p><br />
    <center><h1><u>ABOM WING</u></h1></center>
        <br /> <br />
    <h1>Patchwerk</h1>

    <ajaxToolkit:ComboBox ID="comboPatchwerkLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PatchwerkLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboPatchwerkPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioPatchwerk1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxPatchwerk1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboPatchwerkLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PatchwerkLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboPatchwerkPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioPatchwerk2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxPatchwerk2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboPatchwerkLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PatchwerkLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboPatchwerkPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioPatchwerk3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxPatchwerk3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />


        <br /> <br />
    <h1>Grobbulus</h1>

    <ajaxToolkit:ComboBox ID="comboGrobbulusLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GrobbulusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboGrobbulusPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGrobbulus1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGrobbulus1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboGrobbulusLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GrobbulusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboGrobbulusPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGrobbulus2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGrobbulus2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboGrobbulusLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GrobbulusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboGrobbulusPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGrobbulus3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxGrobbulus3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

        <br /> <br />
    <h1>Gluth</h1>

    <ajaxToolkit:ComboBox ID="comboGluthLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GluthLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboGluthPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGluth1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGluth1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboGluthLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GluthLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboGluthPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGluth2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGluth2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboGluthLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GluthLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboGluthPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGluth3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxGluth3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

        <br /> <br />
    <h1>Thaddius</h1>

    <ajaxToolkit:ComboBox ID="comboThaddiusLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ThaddiusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboThaddiusPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioThaddius1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxThaddius1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboThaddiusLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ThaddiusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboThaddiusPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioThaddius2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxThaddius2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboThaddiusLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ThaddiusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboThaddiusPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioThaddius3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxThaddius3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboThaddiusLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ThaddiusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboThaddiusPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioThaddius4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxThaddius4" CssClass="inlineBlock" runat="server" text="Sidegrade"/>


        <a href="MilitaryWing"></a>
    <p id="MilitaryWing"></>
    <p></p><br />
    <p></p><br />
    <center><h1><u>MILITARY WING</u></h1></center>
        <br /> <br />
    <h1>Instructor Razuvious</h1>

    <ajaxToolkit:ComboBox ID="comboRazuviousLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="RazuviousLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboRazuviousPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioRazuvious1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxRazuvious1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboRazuviousLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="RazuviousLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboRazuviousPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioRazuvious2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxRazuvious2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboRazuviousLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="RazuviousLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboRazuviousPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioRazuvious3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxRazuvious3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

        <br /> <br />
    <h1>Gothik The Harvester</h1>

    <ajaxToolkit:ComboBox ID="comboGothikLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GothikLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboGothikPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGothik1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGothik1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboGothikLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GothikLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboGothikPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGothik2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGothik2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboGothikLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GothikLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboGothikPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioGothik3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxGothik3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

        <br /> <br />
    <h1>Four Horseman</h1>

    <ajaxToolkit:ComboBox ID="comboHorseLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HorseLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboHorsePlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHorse1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHorse1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboHorseLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HorseLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboHorsePlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHorse2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHorse2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboHorseLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HorseLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboHorsePlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHorse3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxHorse3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboHorseLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HorseLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboHorsePlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHorse4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHorse4" CssClass="inlineBlock" runat="server" text="Sidegrade"/>

        <a href="FrostwyrmLair"></a>
    <p id="FrostwyrmLair"></>
    <p></p><br />
    <p></p><br />
    <center><h1><u>FROSTWYRM LAIR</u></h1></center>

        		<br />            <br />  
			<h1>Sapphiron</h1>

			<ajaxToolkit:ComboBox ID="comboSapphironLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SapphironLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
			</ajaxToolkit:ComboBox>            
			<ajaxToolkit:ComboBox ID="comboSapphironPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioSapphiron1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSapphiron1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
			<br />
			<ajaxToolkit:ComboBox ID="comboSapphironLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SapphironLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboSapphironPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioSapphiron2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSapphiron2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
				<br />
				<ajaxToolkit:ComboBox ID="comboSapphironLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SapphironLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboSapphironPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioSapphiron3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxSapphiron3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
			<br />
				<ajaxToolkit:ComboBox ID="comboSapphironLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SapphironLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboSapphironPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioSapphiron4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList> 
    <asp:CheckBox ID="checkboxSapphiron4" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    			<br />
    		<ajaxToolkit:ComboBox ID="comboSapphironLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SapphironLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboSapphironPlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioSapphiron5" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList> 
    <asp:CheckBox ID="checkboxSapphiron5" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    
        		<br />            <br />  
			<h1>KelThuzad</h1>

			<ajaxToolkit:ComboBox ID="comboKelThuzadLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KelThuzadLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
			</ajaxToolkit:ComboBox>            
			<ajaxToolkit:ComboBox ID="comboKelThuzadPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioKelThuzad1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKelThuzad1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
			<br />
			<ajaxToolkit:ComboBox ID="comboKelThuzadLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KelThuzadLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboKelThuzadPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioKelThuzad2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKelThuzad2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
				<br />
				<ajaxToolkit:ComboBox ID="comboKelThuzadLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KelThuzadLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboKelThuzadPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioKelThuzad3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxKelThuzad3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
			<br />
				<ajaxToolkit:ComboBox ID="comboKelThuzadLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KelThuzadLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboKelThuzadPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioKelThuzad4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList> 
    <asp:CheckBox ID="checkboxKelThuzad4" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    			<br />
    		<ajaxToolkit:ComboBox ID="comboKelThuzadLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KelThuzadLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<ajaxToolkit:ComboBox ID="comboKelThuzadPlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
			</ajaxToolkit:ComboBox>
			<asp:RadioButtonList ID="radioKelThuzad5" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
				<asp:ListItem Selected="True">Mainspec</asp:ListItem>
				<asp:ListItem>Offspec</asp:ListItem>
				<asp:ListItem>PvP</asp:ListItem>
			</asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxKelThuzad5" CssClass="inlineBlock" runat="server" text="Sidegrade"/>


        <a href="NaxxTrash"></a>
    <p id="NaxxTrash"></>
    <p></p><br />
    <p></p><br />
    <center><h1><u>TRASH</u></h1></center>
                <br />              <br />  
    <h1>Trash</h1>


        <ajaxToolkit:ComboBox ID="comboTrashLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
    <ajaxToolkit:ComboBox ID="comboTrashLoot10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NaxxTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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