using System;
using System.Collections.Generic;
using System.IO;

namespace ConsoleApp1
{
    class Program
    {
        public static List<string> CedricList;
        public static List<string> KesBoltList;
        public static List<string> BladehqList;
        static void Main(string[] args)
        {
            KesBoltInsert();
            CedricInsert();
            BladehqInsert();
        }

        private static void CedricInsert()
        {
            string sor = "";
            CedricList = new List<string>();
            StreamReader fn = new StreamReader("cedric.txt");
            while ((sor = fn.ReadLine()) != null)
            {
                string[] sorsplit = sor.Split('\t');//1-4

                CedricList.Add($"INSERT INTO CEDRIC_CUT_TESTS(Gyarto,Modell_nev,Acel,Vagasok) \n " +
                    $"VALUES ('{sorsplit[1]}', '{sorsplit[2]}', '{sorsplit[3]}', {sorsplit[4]}); \n");
            }
            fn.Close();
            StreamWriter KimenetiFn = new StreamWriter("cedric_insert.sql");
            foreach (var item in CedricList)
            {
                KimenetiFn.Write(item);
            }
            KimenetiFn.Close();
        }
        private static void KesBoltInsert()
        {
            string sor = "";
            KesBoltList = new List<string>();
            StreamReader fn = new StreamReader("kesbolt.txt");
            while ((sor = fn.ReadLine()) != null)
            {
                string[] sorsplit = sor.Split('\t');//1-10

                KesBoltList.Add($"INSERT INTO KES_BOLT(Gyarto,Modell_nev,Acel_Id,Penge_Hossz,Penge_Vastagsag,Markolat_Anyag,Zar_Szerkezet,Ar,KESZLET_DARABSZAM,Cedric_Id) \n" +
                    $"VALUES('{sorsplit[1]}', '{sorsplit[2]}', {sorsplit[3]}, {sorsplit[4]},{sorsplit[5]},'{sorsplit[6]}', '{sorsplit[7]}',{sorsplit[8]},{sorsplit[9]},{sorsplit[10]}); \n ");
            }
            fn.Close();
            StreamWriter KimenetiFn = new StreamWriter("kesbolt_insert.sql");
            foreach (var item in KesBoltList)
            {
                KimenetiFn.Write(item);
            }
            KimenetiFn.Close();
        }
        private static void BladehqInsert()
        {
            string sor = "";
            BladehqList = new List<string>();
            StreamReader fn = new StreamReader("bladehq.txt");
            while ((sor = fn.ReadLine()) != null)
            {
                string[] sorsplit = sor.Split('\t');//1-5

                BladehqList.Add($"INSERT INTO BLADEHQ_ACEL_ERTEKELES(Acel,Eltartas,Erosseg,Rozsdamentesseg,Elezes_Konnyedsege) \n" +
                    $"VALUES('{sorsplit[1]}', '{sorsplit[2]}', {sorsplit[3]}, {sorsplit[4]},{sorsplit[5]}); \n");
            }
            fn.Close();
            StreamWriter KimenetiFn = new StreamWriter("bladehq_insert.sql");
            foreach (var item in BladehqList)
            {
                KimenetiFn.Write(item);
            }
            KimenetiFn.Close();
        }

    }
}
