using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebService.DATA.Model;

namespace WebService.WebApi.Controllers
{
    public class PacienteController : ApiController
    {
        CLINICAEntities1 db = new CLINICAEntities1();

        [HttpGet]
        public IEnumerable<SP_LISTAPACIENTE_Result> Get()
        {
            return db.SP_LISTAPACIENTE();
        }
        //LISTADO
        [HttpGet]
        public SP_LISTAPACIENTE_Result Get(int id)
        {
            var unPaciente = db.SP_LISTAPACIENTE().Where(p => p.IDE_PAC == id).FirstOrDefault();
            return unPaciente;
        }
        //REGISTRA
        [HttpPost]
        public int Post(PACIENTE objP)
        {
            db.PACIENTE.Add(objP);
            return db.SaveChanges();
        }
        //ACTUALIZA
        [HttpPut]
        public int Put(PACIENTE objP)
        {
            var unPaciente = db.PACIENTE.Where(p => p.IDE_PAC == objP.IDE_PAC).FirstOrDefault();
            
            unPaciente.IDE_PAC = objP.IDE_PAC;
            unPaciente.NOM_PAC = objP.NOM_PAC;
            unPaciente.APE_PAC = objP.APE_PAC;
            unPaciente.FNA_PAC = objP.FNA_PAC;
            unPaciente.FON_PAC = objP.FON_PAC;

            return db.SaveChanges();
        }
        //ELIMINAR
        [HttpDelete]
        public bool Delete(int id)
        {
            var unPaciente = db.PACIENTE.Where(p => p.IDE_PAC == id).FirstOrDefault();
            db.PACIENTE.Remove(unPaciente);
            return db.SaveChanges()>0; /*1 true 0 false*/
        }
    }
}
