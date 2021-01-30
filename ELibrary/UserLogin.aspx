<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ELibrary.UserLogin" %>
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
                                    <img width="100px" src="Images/imgs/generaluser.png" />

        
                                </center>
                           </div>
                           </div>
                           <div class="row">
                           <div class="col">
                                <center>
                                    <h3>Member Login</h3>        
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
                                 <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="textBox1" runat="server" placeholder="UserId"></asp:TextBox>
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
                                 <div class="form-group">
                                  <a href="UserSignUp.aspx"><input class="btn btn-info btn-block btn-lg" id="SignUp" type="button" value="Sign Up" /></a>
                                </div>
                             </div>
                          </div>
                    </div>
                </div>
                <a href="Home.aspx">Back To Home</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
