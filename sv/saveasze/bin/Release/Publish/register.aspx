<%@ Page Title="" Language="C#" MasterPageFile="~/register.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="saveasze.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
                            <a href="index.html" class="col-12"><img src="assets/images/logo.png" alt="" style="width: 120px;"></a>
                            <div class="multiple-tab mt-3">
                                <h4 class="col-12">Welcome, <br><span>please fill the form to register</span></h4>
                                <asp:Label runat="server" ID="lblregMessage"></asp:Label>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="text" id="txtuid" runat="server" placeholder="User Id" required style="background-image: url('assets/images/user.png');background-size: 20px;">
                                </div>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="password" id="txtpassword1" runat="server" onkeyup="check_pass()" placeholder="Password" required style="background-image: url('assets/images/padlock.png');background-size: 17px;">
                                </div>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="password" id="txtpassword2" runat="server" onkeyup="check_pass()" placeholder="Confirm Password" required style="background-image: url('assets/images/padlock.png');background-size: 17px;">
                                <span id='message'></span>
                                </div>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="password" id="txtpin" runat="server" onkeyup="check_pin()" placeholder="Pin Code" required style="background-image: url('assets/images/padlock.png');background-size: 17px;">
                                </div>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="password" id="txtpin2" runat="server" onkeyup="check_pin()" placeholder="Confirm Pin Code" required style="background-image: url('assets/images/padlock.png');background-size: 17px;">
                                 <span id='message1'></span>
                                </div>
                                <p class="col-12 mt-3"><a>By clicking button below, you agree to Savease terms of acceptable use</a></p>
                                <p class="col-12 mt-2 text-center">Areadly have a Savease Account? <a href="login.html">Login</a></p>
                            </div>
                            <div class="multiple-tab">
                                <h4 class="col-12">Personal Information</h4>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="text" id="txtfname" runat="server" placeholder="First name" required style="background-image: url('assets/images/user.png');background-size: 20px;">
                                </div>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="text" id="txtlname" runat="server" placeholder="Last name" required style="background-image: url('assets/images/user.png');background-size: 20px;">
                                </div>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="email" id="txtemail" runat="server" placeholder="Email" required style="background-image: url('assets/images/envelope.png');background-size: 17px;">
                                </div>
                                <div class="form-control">
                                    <!-- <label for="text">User Id</label> -->
                                    <input type="text" id="txtphone" runat="server" placeholder="Phone Number" required style="background-image: url('assets/images/user.png');background-size: 20px;">
                                </div>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="form-control">
                                <div class="row justify-content-center">
                                    <div class="col-5 pl-2 pr-2">
                                        <button type="submit" class="btn col-10 blue-button" id="prevBtn" onclick="nextPrev(-1)">Prev</button>
                                    </div>
                                    <div class="col-5 pl-2 pr-2">
                                      <%-- <button type="submit" class="btn col-10 orange-button" id="nextBtn" onclick="nextPrev(1)">Next</button>--%>
                                       <asp:Button runat="server" ID="nextBtn" CssClass="btn col-10 orange-button" Text="Next"  style="visibility:visible" OnClientClick="return nextPrev(1)" />
                                      <asp:Button runat="server" ID="btn_reg" CssClass="btn col-10 orange-button" Text="Register" style="visibility:hidden" Visible="true" OnClick="btn_reg_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-control text-center">
                                <span class="step"></span>
                                <span class="step"></span>
                                <!-- <span class="step"></span>
                                <span class="step"></span> -->
                            </div>
     <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
            // This function will display the specified tab of the form...
            var x = document.getElementsByClassName("multiple-tab");
            x[n].style.display = "block";
            //... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
                showButtons();
            } else {
                document.getElementById("prevBtn").style.display = "inline";
                showButton();
            }
            if (n == (x.length - 1)) {
               // document.getElementById("nextBtn").innerHTML = "Register";
                 
            } else {
                showButtons();
               // document.getElementById("nextBtn").innerHTML = "Next";
                
            }
            //... and run a function that will display the correct step indicator:
            fixStepIndicator(n)
        }

        function nextPrev(n) {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("multiple-tab");
            // Exit the function if any field in the current tab is invalid:
            if (n == 1 && !validateForm()) return false;
            // Hide the current tab:
            x[currentTab].style.display = "none";
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form...
            if (currentTab >= x.length) {
                // ... the form gets submitted:
                document.getElementById("regForm").submit();
                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }

        function validateForm() {
            // This function deals with validation of the form fields
            var x, y, i, valid = true;
            x = document.getElementsByClassName("multiple-tab");
            y = x[currentTab].getElementsByTagName("input");
            // A loop that checks every input field in the current tab:
            for (i = 0; i < y.length; i++) {
                // If a field is empty...
                if (y[i].value == "") {
                    // add an "invalid" class to the field:
                    y[i].className += " invalid";
                    // and set the current valid status to false
                    valid = false;
                }
            }
            // If the valid status is true, mark the step as finished and valid:
            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid; // return the valid status
        }

        function fixStepIndicator(n) {
            // This function removes the "active" class of all steps...
            var i, x = document.getElementsByClassName("step");
            for (i = 0; i < x.length; i++) {
                x[i].className = x[i].className.replace(" active", "");
            }
            //... and adds the "active" class on the current step:
            x[n].className += " active";
        }
        function showButton() {
            document.getElementById('<%=btn_reg.ClientID%>').style.visibility = 'visible';
            document.getElementById('<%=btn_reg.ClientID%>').style.display = 'inline';
            document.getElementById('<%=nextBtn.ClientID%>').style.visibility = 'hidden';
            document.getElementById('<%=nextBtn.ClientID%>').style.display = 'none';
         }
          function showButtons() {
            document.getElementById('<%=btn_reg.ClientID%>').style.visibility = 'hidden';
            document.getElementById('<%=btn_reg.ClientID%>').style.display = 'none';
            document.getElementById('<%=nextBtn.ClientID%>').style.visibility = 'visible';
            document.getElementById('<%=nextBtn.ClientID%>').style.display = 'inline';
    }
    function check_pass() {
  if (document.getElementById('txtpassword1').value == document.getElementById('txtpassword2').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
   
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
         }

         function check_pin() {
  if (document.getElementById('txtpin').value == document.getElementById('txtpin').value) {
    document.getElementById('message1').style.color = 'green';
    document.getElementById('message1').innerHTML = 'matching';
    
  } else {
    document.getElementById('message1').style.color = 'red';
    document.getElementById('message1').innerHTML = 'not matching';
  }
}
    </script>
                 
</asp:Content>
 