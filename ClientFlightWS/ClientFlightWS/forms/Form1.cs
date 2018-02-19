using ClientFlightWS.FlightWS;
using ClientFlightWS.forms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClientFlightWS
{
    public partial class frmMain : Form
    {
        private FlightWSClient client = new FlightWSClient();

        private List<city> listCitiesFrom = new List<city>();
        private List<city> listCitiesTo = new List<city>();

        private List<flight> listFlight = new List<flight>();

        private BackgroundWorker worker = new BackgroundWorker();

        private DataTable dt;

   

        public frmMain()
        {
            InitializeComponent();

            worker.DoWork += new DoWorkEventHandler(doWork);
            worker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(workCompleted);

            createDataTable();
        }

        private void createDataTable()
        {
            dt = new DataTable();

            dt.Columns.Add("id");
            dt.Columns.Add("Номер");
            dt.Columns.Add("Город отправления");
            dt.Columns.Add("Город прибытия");
            dt.Columns.Add("Код рейса");
            dt.Columns.Add("Дата вылета");
            dt.Columns.Add("Дата прилеты");
            dt.Columns.Add("Длительность");
            dt.Columns.Add("Кол-во мест");
            dt.Columns.Add("Самолет");

            gridFlights.DataSource = dt.DefaultView;
            gridFlights.Columns[0].Visible = false;
        }

       

        private void button1_Click(object sender, EventArgs e)
        {
            
            foreach (city cityItem in client.getAllCities())
            {
                Console.WriteLine(cityItem.name);
            }
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            listCitiesFrom.AddRange(client.getAllCities());
            comboCityFrom.DataSource = listCitiesFrom;
            comboCityFrom.DisplayMember = "Name";
            comboCityFrom.ValueMember = "Name";
            comboCityFrom.DropDownStyle = ComboBoxStyle.DropDownList;

            listCitiesTo.AddRange(client.getAllCities());
            comboCityTo.DataSource = listCitiesTo;
            comboCityTo.DisplayMember = "Name";
            comboCityTo.ValueMember = "Name";
            comboCityTo.DropDownStyle = ComboBoxStyle.DropDownList;

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {

            updateFlights();
        }

        private void updateFlights()
        {
            DateTime jan1st1970 = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            DateTime selectedValue = new DateTime(dateFlight.Value.Year, dateFlight.Value.Month, dateFlight.Value.Day);

            long date = (long)((selectedValue - jan1st1970).TotalMilliseconds);

            city cityFrom = (city)comboCityFrom.Items[comboCityFrom.SelectedIndex];
            city cityTo = (city)comboCityTo.Items[comboCityTo.SelectedIndex];

            WorkerArg arg = new WorkerArg();
            arg.cityFrom = cityFrom;
            arg.cityTo = cityTo;
            arg.date = date;

            worker.RunWorkerAsync(arg);
            picLoading.Visible = true;
        }

        private void doWork(object sender, DoWorkEventArgs e)
        {

            WorkerArg arg = (WorkerArg)e.Argument;

            listFlight.Clear();

            flight[] flights = client.searchFlight(arg.date, arg.cityFrom, arg.cityTo);

            if (flights != null && flights.Length > 0)
            { 
                listFlight.AddRange(flights);
            }
            
            
        }

        private void workCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            dt.Rows.Clear();
            picLoading.Visible = false;

            if (listFlight.Count > 0)
            {

                int i = 0;
                foreach (flight flightItem in listFlight)
                {
                    i++;
                    dt.Rows.Add(
                        flightItem.id,
                        i,
                        flightItem.cityFrom.name,
                        flightItem.cityTo.name,
                        flightItem.code,
                        flightItem.dateDepart,
                        flightItem.dateCome,
                        flightItem.duration,
                        flightItem.aircraft.freePlaceList.Length,
                        flightItem.aircraft.name

                        );
                }

            }
            else
            {
                
                MessageBox.Show("Рейсы не найдены!");
                
            }

            
        }

        private void btnBuy_Click(object sender, EventArgs e)
        {
            if (gridFlights.SelectedRows.Count > 0)
            {

                buyForm buyForm = new buyForm();
                 

                long flightId = Convert.ToInt64(gridFlights.SelectedRows[0].Cells[0].Value);
                flight flightItem = getFlight(flightId);



                buyForm.flight = flightItem;
                buyForm.client = client;

                buyForm.ShowDialog();

                updateFlights();
            }


        }

        private flight getFlight(long id)
        {
            foreach (flight flightItem in listFlight)
            {
                if (flightItem.id == id)
                {
                    return flightItem;
                }
            }

            return null;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            checkForm checkReservationForm = new checkForm();
            checkReservationForm.client = client;
            checkReservationForm.ShowDialog();
        }
    }
}
