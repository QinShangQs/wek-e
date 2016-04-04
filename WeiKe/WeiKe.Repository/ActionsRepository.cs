using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using System.Data;
using WeiKe.Infrastructure;

namespace WeiKe.Repository
{
    public class ActionsRepository
    {
        public static int Add(Actions inst)
        {
            string sql = "insert into Actions (name,begint,endt,content,remark,addtime) ";
            sql += string.Format(" values('{0}','{1}','{2}','{3}','{4}','{5}')",
                inst.name, inst.begint, inst.endt, inst.content,inst.remark,DateTime.Now);
            if (OleDbHelper.ExecuteCommand(sql) > 0)
            {
                return OleDbHelper.GetScalar("select @@IDENTITY");
            }
            return 0;
        }

        public static int Update(Actions inst)
        {
            string sql = "udpate Actions set "
                    + " name = " + inst.name
                    + " ,begint = '" + inst.begint + "'"
                    + " ,endt = '" + inst.endt + "'"
                    + " ,content = '" + inst.content + "'"
                    + " ,remark = '" + inst.remark + "'"
                    + " where id = " + inst.id;
            return OleDbHelper.ExecuteCommand(sql);
        }

        public static int Delete(int id)
        {
            string sql = string.Format("delete from Actions where id = {0}", id);
            return OleDbHelper.ExecuteCommand(sql);
        }


        public static Actions GetById(int id)
        {
            string sql = string.Format("select * from Actions where id = {0}", id);
            Actions inst = null;
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    inst = Read(r);
                }
            }

            return inst;
        }

        public static IList<Actions> FindAll(string sql = "")
        {
            sql = string.IsNullOrEmpty(sql) ? "select * from Actions" : sql;
            IList<Actions> list = new List<Actions>();
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    list.Add(Read(r));
                }
            }
            return list;
        }

        private static Actions Read(DataRow r)
        {
            Actions inst = new Actions();
            inst.id = CommonUtil.ParseInt(r["id"]);
            inst.name = CommonUtil.ParseStr(r["name"]);
            inst.begint = CommonUtil.ParseStr(r["begint"]);
            inst.endt = CommonUtil.ParseStr(r["endt"]);
            inst.content = CommonUtil.ParseStr(r["content"]);
            inst.remark = CommonUtil.ParseStr(r["remark"]);
            inst.addtime = CommonUtil.ParseStr(r["addtime"]);            
            return inst;
        }
    }
}
