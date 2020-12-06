using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using WebService.DATA.Model;

namespace WebService.ClienteWebAPI.Controllers
{
    public class PacienteController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }

        public List<SP_LISTAPACIENTE_Result> listPaciente()
        {
            //System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;

            HttpClient clienteHtpp = new HttpClient();
            clienteHtpp.BaseAddress = new Uri("http://localhost:54100/");
            var request = clienteHtpp.GetAsync("Api/Paciente").Result;
           
            //http://localhost:54100/Api/Paciente

            var rs = request.Content.ReadAsStringAsync().Result;
            var liPaciente = JsonConvert.DeserializeObject<List<SP_LISTAPACIENTE_Result>>(rs);

            return liPaciente.ToList();

        }

        public ActionResult listadoPacientes()
        {
            return View(listPaciente());
        }

    }
}