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
            }
            return user;
        }

        public static bool Register(Users inst, string message) 
        {
            if (UsersRepository.GetByName(inst.name) != null) 
            {
                message = "账号已存在，请更换！";
                return false;
            }

            return UsersRepository.Add(inst) > 0;
        }
    }
}
