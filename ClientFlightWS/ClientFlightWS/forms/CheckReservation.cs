using ClientFlightWS.FlightWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClientFlightWS.forms
{
    public partial class checkForm : Form
    {

        public FlightWSClient client { get; set; }

        public checkForm()
        {
            InitializeComponent();
        }

        private void btnCheck_Click(object sender, EventArgs e)
        {
            reservation reserv = client.checkReservationByCode(txtCode.Text);

            if (reserv != null)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("Рейс: ").Append(reserv.flight.code).Append("\n");
                sb.Append("Самолет: ").Append(reserv.flight.aircraft.name).Append("\n");
                sb.Append("Дата вылета: ").Append(reserv.flight.dateDepart).Append("\n");
                sb.Append("Дата прилета: ").Append(reserv.flight.dateCome).Append("\n");
                sb.Append("Место: ").Append(reserv.place.seatLetter).Append(reserv.place.seatNumber).Append("\n");

                MessageBox.Show(sb.ToString());
            }
            else
            {
                MessageBox.Show("Ничего не найдено!");
            }
        }
    }
}
