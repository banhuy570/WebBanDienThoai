using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Windows;
using System.Text;

namespace TestUngDung.Common
{
    public static class Decrypt
    { public static string MHMD5(string mahoa)
        { 
        //Tạo MD5
        MD5 mh = MD5.Create();
        //Chuyển kiểu chuổi thành kiểu byte
        byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(mahoa);
        //mã hóa chuỗi đã chuyển
        byte[] hash = mh.ComputeHash(inputBytes);
        ////tạo đối tượng StringBuilder (làm việc với kiểu dữ liệu lớn)
        //StringBuilder sb = new StringBuilder();

        //    for (int i = 0; i<hash.Length; i++)
        //        sb.Append(hash.ToString("X2"));
            return hash.ToString();
        }

        public static string DecryptMD5(string toDecrypt , string key)
        {
            bool useHashing = true;
            byte[] keyArray;
            byte[] toEncryptArray = Convert.FromBase64String(toDecrypt);

            if (useHashing)
            {
                MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            }
            else
                keyArray = UTF8Encoding.UTF8.GetBytes(key);

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateDecryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

            return UTF8Encoding.UTF8.GetString(resultArray);
        }
    }
}