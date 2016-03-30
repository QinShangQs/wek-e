using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using System.Data;
using WeiKe.Infrastructure;

namespace WeiKe.Repository
{
    public class CategoryRepository
    {
        public static Category GetById(int id)
        {
            string sql = string.Format("select * from users where id = {0}", id);
            Category inst = null;
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    inst = Read(r);
                }
            }

            return inst;
        }

        private static Category Read(DataRow r)
        {
            Category inst = new Category();
            inst.id = CommonUtil.ParseInt(r["id"]);
            inst.title = CommonUtil.ParseStr(r["title"]);
            inst.parentId = CommonUtil.ParseInt(r["parentId"]);
            return inst;
        }
    }
}
