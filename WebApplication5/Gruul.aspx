<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Gruul.aspx.cs" Inherits="WebApplication5.BlackwingLair" %>

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
            <asp:SqlDataSource ID="MaulgarLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Maulgar')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="GruulLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Gruul')"></asp:SqlDataSource>
            <br /><br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of Gruul's Lair Raid</b></asp:Label>
            <asp:Calendar ID="calendarGruul" runat="server" OnSelectionChanged="calendarGruul_SelectionChanged"></asp:Calendar>
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
            <h1>High King Maulgar</h1>
            <br />

            <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>
            <ajaxToolkit:ComboBox ID="comboMaulgarLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaulgarLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>            
            <ajaxToolkit:ComboBox ID="comboMaulgarPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMaulgar1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
            <asp:CheckBox ID="checkboxMaulgar1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboMaulgarLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaulgarLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMaulgarPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMaulgar2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMaulgar2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />
                <ajaxToolkit:ComboBox ID="comboMaulgarLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaulgarLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMaulgarPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMaulgar3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMaulgar3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
    <br />

                <ajaxToolkit:ComboBox ID="comboMaulgarLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaulgarLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>            
            <ajaxToolkit:ComboBox ID="comboMaulgarPlayer4" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMaulgar4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
             <asp:CheckBox ID="checkboxMaulgar4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />


            <br />            <br />  
            <h1>Gruul the Dragon Killer</h1>

            <ajaxToolkit:ComboBox ID="comboGruulLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GruulLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>            
            <ajaxToolkit:ComboBox ID="comboGruulPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGruul1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGruul1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboGruulLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GruulLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboGruulPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGruul2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGruul2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />
            <ajaxToolkit:ComboBox ID="comboGruulLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GruulLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboGruulPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGruul3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
            <asp:ListItem Selected="True">Mainspec</asp:ListItem>
            <asp:ListItem>Offspec</asp:ListItem>
            <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
            <asp:CheckBox ID="checkboxGruul3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
    <br />
                    <ajaxToolkit:ComboBox ID="comboGruulLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GruulLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboGruulPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGruul4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGruul4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />



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