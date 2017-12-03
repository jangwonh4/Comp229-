<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CoursePage.aspx.cs" Inherits="COMP229_Assignment3.CoursePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul>
        <asp:Repeater ID="myRepeater" runat="server" OnItemCommand="myRepeater_ItemCommand" >
            <ItemTemplate>
                <li>
                    
                    <span id="class"><%# Eval("Title") %></span>
                    <asp:Button runat="server" Text="Update" CommandName="updateCommand" CommandArgument='<%# Eval("Title") %>' />
                    <asp:Button runat="server" Text="Delete" CommandName="deleteCommand" CommandArgument='<%# Eval("CourseID") %>' />
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>    

 <asp:Button ID="Button1" runat="server" Text="Update" />
    <asp:Button ID="Button2" runat="server" Text="Delete" />
</asp:Content>
