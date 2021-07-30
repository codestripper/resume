using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.EntityFrameworkCore.Internal;
using Microsoft.Extensions.Logging;
using resume.Data;
using resume.Models;
using resume.Models.AdventureWorks;

namespace resume.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly AdventureWorksContext _context;

        public HomeController(ILogger<HomeController> logger, AdventureWorksContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult DataAnalysis() {
            var data = new AnalysisData();
            data.Phonebook = from e in _context.Employees
                             from edh in _context.EmployeeDepartmentHistories.Where(edh => e.BusinessEntityId == edh.BusinessEntityId).DefaultIfEmpty()
                             from d in _context.Departments.Where(d => edh.DepartmentId == d.DepartmentId).DefaultIfEmpty()
                             from s in _context.Shifts.Where(s => edh.ShiftId == s.ShiftId).DefaultIfEmpty()
                             from ea in _context.EmailAddresses.Where(ea => ea.BusinessEntityId == edh.BusinessEntityId).DefaultIfEmpty()
                             from pp in _context.PersonPhones.Where(pp => pp.BusinessEntityId == edh.BusinessEntityId).DefaultIfEmpty()
                             from p in _context.People.Where(p => p.BusinessEntityId == edh.BusinessEntityId).DefaultIfEmpty()
                             select new PhonebookEntry(e.LoginId, p.FirstName, p.LastName, ea.EmailAddress1, pp.PhoneNumber, e.JobTitle, d.Name, s.Name, s.StartTime, s.EndTime);
            return View(data);
        }

        [Authorize]
        public IActionResult Secured() {
            return View();
        }

        [Authorize]
        [HttpGet("login")]
        public IActionResult Login() {
            return Redirect("/");
        }

        [HttpGet("denied")]
        public IActionResult Denied() {
            return View();
        }

        [Authorize]
        public async Task<IActionResult> Logout() {
            await HttpContext.SignOutAsync();
            return Redirect("/");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
