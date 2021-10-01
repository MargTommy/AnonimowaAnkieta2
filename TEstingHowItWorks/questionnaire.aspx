<%@ Page Title="Strona Główna" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="questionnaire.aspx.cs" Inherits="AnonimowaAnkieta.questionnaire" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron">
        <h1>Anonimowa Ankieta</h1>
        <p class="lead">Anonimowa Ankieta - Strona pokazowastworzona przy pomocy ASP.NET C#, EntetyFramework oraz T-SQL.</p>
    </div>
    <div>
        <p>
        <asp:Literal ID="valMassage" runat="server"/>
        <asp:ValidationSummary ID="valSumm" runat="server" ValidationGroup="formVal" DisplayMode="BulletList" HeaderText="Przoszę uzupełnić:" Visible="false"/>
            
        </p>
    </div>
    <div>
        <h2>1. Skala.</h2>
        <div ID="Scale">
              <asp:DropDownList ID="ddlScale" runat="server" ValidationGroup="formVal"/>
            <asp:RequiredFieldValidator  ID="rqddlScale" InitialValue="" runat="server"  ValidationGroup="formVal" ErrorMessage="Wybierz wartść na skali!"  Dispaly ="Dynamic" ControlToValidate="ddlScale"/>
        </div>
    </div>
    <div >
        <h2>2. Informacja wzrotna.</h2>
        <div>
          <asp:TextBox ID="tbSTRFeed" rows="8" TextMode="multiline" runat="server" columns="50" BorderWidth="2px" Width="500" ValidationGroup="formVal" />
        <asp:RequiredFieldValidator InitialValue="" ID="rqSTRFeed" runat="server"  CssClass="bg-error" ValidationGroup="formVal" ErrorMessage="Napisz coś!"  Dispaly ="Dynamic" ControlToValidate="tbSTRFeed"/>
        </div>
    </div>
    <div>       
        <h2>3. Tak/Nie</h2>
        <asp:DropDownList ID="ddlTF" runat="server" ValidationGroup="formVal">
            <asp:ListItem Selected Value=""></asp:ListItem>
            <asp:ListItem Value="true">Tak</asp:ListItem>
            <asp:ListItem Value="false">Nie</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator  ID="reqddlTF" InitialValue="" runat="server"  ValidationGroup="formVal" Type="Boolean" ErrorMessage="Wybierz odpowiedź!"  Dispaly ="Dynamic" ControlToValidate="ddlTF"/>
    </div>
    <div style="padding-top:50px;">
        <asp:Button ID="btnSubmit" runat="server" Text="Prześlij" OnClick="btnSubmit_Click" ValidationGroup="formVal" CausesValidation="true"/>
    </div>

</asp:Content>
