<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ELibrary.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                       <div class="row">
                           <div class="col">
                                <center>
                                    <img width="150px" src="Images/imgs/adminuser.png" />
                                </center>
                           </div>
                           </div>
                           <div class="row">
                           <div class="col">
                                <center>
                                    <h3>Admin Login</h3>        
                                </center>
                           </div>
                          </div>
                          <div class="row">
                             <div class="col">
                                <hr />
                             </div>
                          </div>
                          <div class="row">
                             <div class="col">
                                 <label>Admin ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="textBox1" runat="server" placeholder="Email Id" OnTextChanged="textBox1_TextChanged"></asp:TextBox>
                                </div>
                             </div>
                          </div>
                        <div class="row">
                             <div class="col">
                                 <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="textBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                     <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Login" runat="server" Text="Login" OnClick="Login_Click" />
                                </div>
                             </div>
                          </div>
                    </div>
                </div>
                <a href="Home.aspx"><< Back To Home</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
