using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Formatting;
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
            clienteHtpp.BaseAddress = new Uri("http://localhost:64142/");
            var request = clienteHtpp.GetAsync("Api/Paciente").Result;

            //http://localhost:64142/Api/Paciente

            var rs = request.Content.ReadAsStringAsync().Result;
            var liPaciente = JsonConvert.DeserializeObject<List<SP_LISTAPACIENTE_Result>>(rs);

            return liPaciente.ToList();

        }

        public ActionResult listadoPacientes()
        {
            return View(listPaciente());
        }


        [HttpPost]
        public ActionResult nuevoPaciente(PACIENTE objP)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.ultimo = listPaciente().Last().IDE_PAC + 1;
                return View(objP);
            }
            HttpClient clienteHttp = new HttpClient();
            clienteHttp.BaseAddress = new Uri("http://localhost:64142/");
            var request = clienteHttp.PostAsync("Api/Paciente", objP, new JsonMediaTypeFormatter()).Result;
            if (request.IsSuccessStatusCode)
            {
                var resultString = request.Content.ReadAsStringAsync().Result;
                var estado = JsonConvert.DeserializeObject<int>(resultString);
                if (estado == 1)
                {
                    ViewBag.ultimo = listPaciente().Last().IDE_PAC;
                    ViewBag.mensaje = estado + " Paciente registrado correctamente..!!";
                    return View(objP);
                }
                return View(objP);
            }
            return View();
        }

        public ActionResult nuevoPaciente()
        {
            ViewBag.ultimo = listPaciente().Last().IDE_PAC + 1;
            return View(new PACIENTE());
        }


        [HttpGet]
        public ActionResult actualizarPaciente(int id)
        {
            HttpClient clienteHttp = new HttpClient();
            clienteHttp.BaseAddress = new Uri("http://localhost:64142/");
            var request = clienteHttp.GetAsync("Api/Paciente?id=" + id).Result;
            if (request.IsSuccessStatusCode)
            {
                var resultString = request.Content.ReadAsStringAsync().Result;
                var objP = JsonConvert.DeserializeObject<PACIENTE>(resultString);
                return View(objP);
            }
            return View();
        }

        [HttpPost]
        public ActionResult actualizarPaciente(PACIENTE objP)
        {
            HttpClient clienteHttp = new HttpClient();
            clienteHttp.BaseAddress = new Uri("http://localhost:64142/");
            var request = clienteHttp.PutAsync("Api/Paciente", objP, new JsonMediaTypeFormatter()).Result;
            if (request.IsSuccessStatusCode)
            {
                var resultString = request.Content.ReadAsStringAsync().Result;
                var estado = JsonConvert.DeserializeObject<int>(resultString);
                if (estado == 1)
                {
                    ViewBag.mensaje = estado + " Paciente actualizado correctamente..!!";
                    return View(objP);
                }
                return View(objP);
            }
            return View();
        }

        [HttpGet]
        public ActionResult detallePaciente(int id)
        {
            HttpClient clienteHttp = new HttpClient();
            clienteHttp.BaseAddress = new Uri("http://localhost:64142/");
            var request = clienteHttp.GetAsync("Api/Paciente?id=" + id).Result;
            if (request.IsSuccessStatusCode)
            {
                var resultString = request.Content.ReadAsStringAsync().Result;
                var objD = JsonConvert.DeserializeObject<PACIENTE>(resultString);
                return View(objD);
            }
            return View();
        }

        [HttpGet]
        public ActionResult eliminarPaciente(int id)
        {
            HttpClient clienteHttp = new HttpClient();
            clienteHttp.BaseAddress = new Uri("http://localhost:64142/");
            var request = clienteHttp.DeleteAsync("Api/Paciente?id=" + id).Result;
            if (request.IsSuccessStatusCode)
            {
                var resultString = request.Content.ReadAsStringAsync().Result;
                var estado = JsonConvert.DeserializeObject<bool>(resultString);
                if (estado)
                {
                    return RedirectToAction("listadoPacientes");
                }
            }
            return View();
        }

    }
}