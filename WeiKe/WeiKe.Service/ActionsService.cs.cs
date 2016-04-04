using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Repository;

namespace WeiKe.Service
{
    public class ActionsService
    {
        public static bool Create(Actions inst)
        {
            return ActionsRepository.Add(inst) > 0;
        }

        public static bool Edit(Actions inst)
        {
            return ActionsRepository.Update(inst) > 0;
        }

        public static bool Remove(int id)
        {
            return ActionsRepository.Delete(id) > 0;
        }

        public static Actions GetById(int id)
        {
            return ActionsRepository.GetById(id);
        }

        public static IList<Actions> RetrievesAll()
        {
            return ActionsRepository.FindAll().OrderByDescending(m => m.id).ToList() ;
        }
    }
}
