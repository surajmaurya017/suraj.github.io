<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="ELibrary.AdminMemberManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
                 <div class="row">
                     <div class="col-md-5">
                       <div class="card">
                          <div class="card-body">
                               <div class="row">
                                  <div class="col">
                                    <center>
                                        <h4>Member Details</h4> 
                                      </center>
                                    </div>
                               </div>
                                <div class="row">
                                  <div class="col">
                                    <center>
                                      <img width="100px"src="Images/imgs/generaluser.png" />
                                     </center>
                                    </div>
                               </div>                                                    
                               <div class="row">
                                  <div class="col">
                                      <hr />
                                   </div>
                              </div>

                         
                   <div class="row">
                        

                       <div class="col-md-3">
                        <label>Member ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="ID"></asp:TextBox>
                              <asp:Button class="btn btn-primary " ID="Button3" runat="server" Text="Go" OnClick="Button3_Click"  />
                           </div>
                        </div>
                     </div>



                              <div class="col-md-4">
                               <label>Full Name</label>
                                  <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" readonly="true"></asp:TextBox>
                                 </div>
                           </div>

                       <div class="col-md-5">
                        <label>Account Status</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control mr-1" ID="TextBox1" runat="server" placeholder="Status" readonly="true"></asp:TextBox>
                               <asp:linkbutton class="btn btn-success mr-1" ID="LinkButton3" runat="server" Text="A" OnClick="LinkButton3_Click"><i class="fas fa-check-circle"></i></asp:linkbutton>
                               <asp:linkbutton class="btn btn-warning mr-1" ID="Linkbutton1" runat="server" Text="P" OnClick="Linkbutton1_Click"><i class="fas fa-pause-circle"></i></asp:linkbutton>
                               <asp:linkbutton class="btn btn-danger" ID="Linkbutton2" runat="server" Text="D" OnClick="Linkbutton2_Click"><i class="fas fa-times-circle"></i></asp:linkbutton>
                           </div>
                        </div>
                     </div>

                     
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Date Of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                      <div class="col-md-5">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Email" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="State" readonly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City" readonly="true"></asp:TextBox>
                        </div>
                     </div>

                      <div class="col-md-4">
                        <label>Pincode</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Pincode" readonly="true"></asp:TextBox>
                        </div>
                     </div>

                  </div>
                    
                   <div class="row">
                       <div class="col-12">
                        <label>Full Postal Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Full Postal Address" readonly="true" TextMode="MultiLine"></asp:TextBox>
                        </div>
                     </div>

                   </div>

                  <div class="row">
                     
                     <div class="col-8 mx-auto">
                         <asp:Button CssClass="btn btn-danger btn-block" ID="Button1" runat="server" Text="Delete User Permanently" OnClick="Button1_Click" />

                      
                     </div>                      

                  </div>
                                   
                    </div>
                       </div>
                         <a href="Home.aspx"> << Back To Home</a><br /><br />
                     </div>

                      <div class="col-md-7">
                         <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h4>Member List</h4>              
                                         </center>
                                    </div>
                                </div>
                                     <div class="row">
                                         <div class="col">
                                              <hr />
                                         </div>
                                     </div> 
                                    <div class="row">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                         <div class="col">
                                              <div style="overflow: scroll">

                                             <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                                 <Columns>
                                                     <asp:BoundField DataField="member_id" HeaderText="Member Id" ReadOnly="True" SortExpression="member_id" />
                                                     <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                                     <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                                     <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                                     <asp:BoundField DataField="email" HeaderText="Emails" SortExpression="email" />
                                                     <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                                     <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                                     
                                                     
                                                 </Columns>
                                             </asp:GridView>
                                                  </div>
                                         </div>
                                     </div> 
                             </div>
                          </div> 
                     </div> 
                 </div>
                  
     </div> 

</asp:Content>
