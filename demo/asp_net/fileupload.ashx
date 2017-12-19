<%@ WebHandler Language="C#" Class="fileupload" %>

using System;
using System.Web;
using System.IO;
public class fileupload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string target_path = context.Server.MapPath("uploads/");
        var uploadFile = context.Request.Files["fileToUpload"];

        var size = uploadFile.ContentLength;
        string name = uploadFile.FileName;
        string name2 = context.Request.QueryString["filename"];
        var target_file = Path.Combine(target_path, name);
        string complete_path = Path.Combine(target_path, name2);
        uploadFile.SaveAs(complete_path);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
