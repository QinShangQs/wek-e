using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;

namespace WeiKe.Infrastructure
{
    public static class CommonUtil
    {
        public static string GetDTString(DateTime? dt) 
        {
            return dt.HasValue ? dt.Value.ToString("yyyy-MM-dd HH:mm:ss") : string.Empty;
        }

        public static string GetDTString(DateTime dt)
        {
            return dt.ToString("yyyy-MM-dd HH:mm:ss");
        }

        public static DateTime? GetDateTime(string dateStr) 
        {
            DateTime dt = DateTime.Now;
            if (DateTime.TryParse(dateStr, out dt))
            {
                return dt;
            }
            return null;
        }

        /// <summary>
        /// 将字符串转换为整型集合,分隔符为','
        /// 非重复数组
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static IList<int> CutToIntArray(string str, char split = ',') 
        {
            IList<int> list = new List<int>();
            string[] arr = str.Split(split);
            foreach (string a in arr)
            {
                int x = 0;
                if (int.TryParse(a, out x)) 
                {
                    if(!list.Contains(x))
                        list.Add(x);
                }
                    
            }
            return list;
        }

        public static int ParseInt(object obj) 
        {
            int x = 0;
            string str = ParseStr(obj);
            int.TryParse(str, out x);
            return x;
        }

        public static double ParseFloat(object obj)
        {
            double x = 0;
            string str = ParseStr(obj);
            double.TryParse(str, out x);
            return x;
        }

        public static string ParseStr(object obj)
        {
            return obj == null ? string.Empty : obj.ToString();
        }

        public static string Serialize(object obj) 
        {
            return new JavaScriptSerializer().Serialize(obj);
        }

        public static T DeSerialize<T>(string json) 
        {
            return new JavaScriptSerializer().Deserialize<T>(json);
        }
    }
}
