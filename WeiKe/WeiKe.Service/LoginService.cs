using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Repository;

namespace WeiKe.Service
{
    public class LoginService
    {
        public static Users Login(string userName, string password, ref string message) 
        {
            Users user = UsersRepository.GetByName(userName);
            if (user == null)
            {
                message = "账号不存在！";
            }
            else if (user.pwd != password) 
            {
                message = "账号或密码不正确！";
                user = null;
            }
            return user;
        }

        public static Users Register(Users inst,ref string message) 
        {
            if (UsersRepository.GetByName(inst.name) != null) 
            {
                message = "账号已存在，请更换！";
                return null;
            }

            int newId = UsersRepository.Add(inst);
            if (newId > 0) 
            {
                return UsersRepository.GetById(newId);
            }
            return null;
        }
    }
}
