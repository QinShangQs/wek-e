using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiKe.Model
{
    public class Users
    {
        public int id { get; set; }
        public string name { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string sex{get;set;}
        public string birthday { get; set; }
        public string school { get; set; }
        public string grad { get; set; }
        public string parentName { get; set; }
        public string parentPhone { get; set; }
        public string headerImg { get; set; }
        public string addtime { get; set; }
        public int categoryId { get; set; }
        public string pwd { get; set; }
        public string roleName { get; set; }
        /// <summary>
        /// 学历
        /// </summary>
        public string degree { get; set; }
        /// <summary>
        /// 经验
        /// </summary>
        public string experience { get; set; }

        public Category category { get; set; }
    }
}
