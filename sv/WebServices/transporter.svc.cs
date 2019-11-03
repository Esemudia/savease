using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace WebServices
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class transporter
    {
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        private static List<String> lst = new List<String>(new String[] {"Arrays","Queues","Stacks"});
        [OperationContract]
        public void DoWork()
        {
            // Add your operation implementation here
            return;
        }

        // Add more operations here and mark them with [OperationContract]
        [WebGet(UriTemplate = "/Verifypin")]

        public String GetAllTutorial()
        {
            int count = lst.Count;
            String VerifypinLST = "";
            for (int i = 0; i < count; i++)
                VerifypinLST = VerifypinLST + lst[i] + ",";
            return VerifypinLST;
        }
        [WebGet(UriTemplate = "/Verifypin/{pinid}")]

        public String GetTutorialbyID(String Pinid)
        {
            int pid;
            Int32.TryParse(Pinid, out pid);
            return lst[pid];
        }
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json,
    UriTemplate = "/Verifypin/{pinid}", ResponseFormat = WebMessageFormat.Json,
    BodyStyle = WebMessageBodyStyle.Wrapped)]
        public void addPIN(String str)
        {
            lst.Add(str);
        }
        [WebInvoke(Method = "DELETE", RequestFormat = WebMessageFormat.Json,
    UriTemplate = "/Verifypin/{pinid}", ResponseFormat = WebMessageFormat.Json,
    BodyStyle = WebMessageBodyStyle.Wrapped)]
        public void DeletePin(String pinid2)
        {
            int pid;
            Int32.TryParse(pinid2, out pid);
            lst.RemoveAt(pid);
        }
    }
}
