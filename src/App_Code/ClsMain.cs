using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ClsMain
/// </summary>
public static  class ClsMain
{

    public static string ConnStr = "data source=DESKTOP-U9KI20P; initial catalog=eforum; integrated security=sspi";

    public static void CreateMessageAlert(System.Web.UI.Page AspxPage, string StrMessage, string StrKey)
    {
        string StrScript;
        StrScript = "<script language=javaScript>alert('" + StrMessage + "')</script>";
        if (AspxPage.IsStartupScriptRegistered(StrKey) == false)
        {
            AspxPage.RegisterStartupScript(StrKey, StrScript);
        }
    }



       public static String TextParse(String StrIn )  
       {

       string[,] A = new string[100, 2];
        A[0, 0] = "[:)]";
        A[0, 1] = "<img src = 'images/icons/icon_smile.gif'>";

        A[1, 0] = "[:D]";
        A[1, 1] = "<img src = 'images/icons/icon_smile_big.gif'>";

        A[2, 0] = "[8D]";
        A[2, 1] = "<img src = 'images/icons/icon_smile_cool.gif'>";

        A[3, 0] = "[:I]";
        A[3, 1] = "<img src = 'images/icons/icon_smile_blush.gif'>";

        A[4, 0] = "[:p]";
        A[4, 1] = "<img src = 'images/icons/icon_smile_tongue.gif'>";

        A[5, 0] = "[}:)]";
        A[5, 1] = "<img src = 'images/icons/icon_smile_evil.gif'>";

        A[6, 0] = "[;)]";
        A[6, 1] = "<img src = 'images/icons/icon_smile_wink.gif'>";

        A[7, 0] = "[:o)]";
        A[7, 1] = "<img src = 'images/icons/icon_smile_clown.gif'>";

        A[8, 0] = "[B)]";
        A[8, 1] = "<img src = 'images/icons/icon_smile_blackeye.gif'>";

        A[9, 0] = "[8]";
        A[9, 1] = "<img src = 'images/icons/icon_smile_8ball.gif'>";

        A[10, 0] = "[:(]";
        A[10, 1] = "<img src = 'images/icons/icon_smile_sad.gif'>";

        A[11, 0] = "[8)]";
        A[11, 1] = "<img src = 'images/icons/icon_smile_shy.gif'>";

        A[12, 0] = "[:0]";
        A[12, 1] = "<img src = 'images/icons/icon_smile_shock.gif'>";

        A[13, 0] = "[:(!]";
        A[13, 1] = "<img src = 'images/icons/icon_smile_angry.gif'>";

        A[14, 0] = "[xx(]";
        A[14, 1] = "<img src = 'images/icons/icon_smile_dead.gif'>";

        A[15, 0] = "[|)]";
        A[15, 1] = "<img src = 'images/icons/icon_smile_sleepy.gif'>";

        A[16, 0] = "[:X]";
        A[16, 1] = "<img src = 'images/icons/icon_smile_kisses.gif'>";

        A[17, 0] = "[^]";
        A[17, 1] = "<img src = 'images/icons/icon_smile_approve.gif'>";

        A[18, 0] = "[V]";
        A[18, 1] = "<img src = 'images/icons/icon_smile_disapprove.gif'>";

        A[19, 0] = "[?]";
        A[19, 1] = "<img src = 'images/icons/icon_smile_question.gif'>";



        A[20, 0] = "[B]";
        A[20, 1] = "<B>";

        A[21, 0] = "[I]";
        A[21, 1] = "<I>";

        A[22, 0] = "[U]";
        A[22, 1] = "<U>";


        A[23, 0] = "[L]";
        A[23, 1] = "<L>";


        A[24, 0] = "[C]";
        A[24, 1] = "<C>";


        A[25, 0] = "[R]";
        A[25, 1] = "<R>";


        A[26, 0] = "[HR]";
        A[26, 1] = "<HR>";


        A[27, 0] = "[UR]";
        A[27, 1] = "<UR>";


        A[28, 0] = "[EM]";
        A[28, 1] = "<EM>";


        A[29, 0] = "[/B]";
        A[29, 1] = "</B>";

        A[30, 0] = "[/I]";
        A[30, 1] = "</I>";

        A[31, 0] = "[/U]";
        A[31, 1] = "</U>";

        A[32, 0] = "[/UR]";
        A[32, 1] = "</A>";



        //>>>
        int i ;
        String T ;
        String S1;
        S1 = StrIn;
        if (S1 == "")
        {
        }
        else
        {
            S1 = S1.Replace("\n", "<br>");
            S1 = S1.Replace(" ", "&nbsp;");
        }
        T = S1;
        for ( i = 0;i<100;i++)
        {
            if (A[i, 0] != null)
            {
                T = T.Replace(A[i, 0], A[i, 1]);
            }
        }


        return ( T);
       }
}
