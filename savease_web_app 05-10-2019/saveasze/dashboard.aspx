<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="saveasze.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="col-12 p-5">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-12 col-lg-5 pl-md-5 pr-md-5 pl-0 pr-0 mt-2">
                                <div class="dash-card col-12">
                                    <div class="dash-card-head col-12">
                                        <h5 class="dash-card-title">MY ACCOUNT</h5>
                                        <asp:Label runat="server" ID="lblMessage"></asp:Label>
                                    </div>
                                    <div class="dash-card-body col-12">
                                        <div class="row justify-content-center">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-6 text-left mb-5">
                                                        <div class="row justify-content-center">
                                                            <p class="col-12">Account Number</p>
                                                            <h6 class="col-12"><asp:Label runat="server" ID="lblacc"></asp:Label></h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 text-right mb-5">
                                                        <div class="row">
                                                            <p class="col-12">Account Status</p>
                                                            <h6 class="col-12 status-active">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none"><circle cx="5" cy="5" r="5" class="status-active-svg"/></svg> Active
                                                            </h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-6 text-left">
                                                        <div class="row">
                                                            <p class="col-12">Current Balance</p>
                                                            <h6 class="col-12 balance"><asp:Label runat="server" ID="lblBalh"></asp:Label></h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 text-right">
                                                        <div class="row justify-content-end align-items-end">
                                                            <button class="btn pl-3 pr-3">Fund Account</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-5 pl-md-5 pr-md-5 pl-0 pr-0 mt-2">
                                <div class="dash-card col-12">
                                    <div class="dash-card-head col-12">
                                        <h5 class="dash-card-title">MY GOALS</h5>
                                    </div>
                                    <div class="dash-card-body col-12">
                                        <div class="row justify-content-center">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-6 text-left mb-4">
                                                        <div class="row justify-content-start">
                                                            <span class="col-12 span mb-1 text-center">1</span>
                                                            <p class="col-12 text-center">Running Goal</p>
                                                            <a href="goal.html" class="btn mx-auto pl-3 pr-3">Create Goal</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 text-right mb-4">
                                                        <div class="row">
                                                            <div class="achieve">
                                                                <div>
                                                                    <span>50%</span>
                                                                    <small>Goal Achived</small>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 bg-white mt-5 pt-2 pl-3 pr-5">
                                <div class="row justify-content-center">
                                    <canvas id="userChart" width="400" height="400"></canvas>
                                </div>
                                <div class="row justify-content-start mt-2">
                                    <asp:GridView PageSize="5" AllowPaging="true" OnPageIndexChanging="gridTransaction_PageIndexChanging" runat="server" ID="gridTransaction" CssClass="table table-striped table-borderless table-responsive-sm">

                                    </asp:GridView>
                                   
                                </div>
                            </div>
                        </div>
                    </section>

    
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/slick.min.js"></script>
    <script src="../assets/js/popper.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="assets/js/chartjs.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        {
            const userLineChart = document.querySelector('#userChart');
            let options = {
                maintainAspectRatio: false,
                scales: {
                    yAxes: [{
                        stacked: true,
                        gridLines: {
                            display: true,
                            color: "rgba(255,99,132,0.2)"
                        }
                    }],
                    xAxes: [{
                        gridLines: {
                            display: false
                        }
                    }]
                }
            };
            let lineChart = new Chart(userLineChart, {
                type: 'line',
                data: {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                        label: '# of Votes',
                        data: [12, 19, 3, 5, 2, 3],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: options
            });
        }
    </script>
</asp:Content>
