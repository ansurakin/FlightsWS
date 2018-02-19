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
    public partial class buyForm : Form
    {
        public FlightWSClient client { get; set; }
        public flight flight {get; set;}

        public List<place> freePlaces { get; set; }

        public buyForm()
        {
            InitializeComponent();
        }

        private void btnBuy_Click(object sender, EventArgs e)
        {
            passenger passengerItem = new passenger();
            passengerItem.documentNumber = txtDocument.Text;
            passengerItem.email = txtMail.Text;
            passengerItem.familyName = txtSecondName.Text;
            passengerItem.givenName = txtFirstName.Text;
            passengerItem.middleName = txtMiddleName.Text;
            passengerItem.phone = txtPhone.Text;

            long placeId = Convert.ToInt64(comboPlaces.SelectedValue);

            client.buyTicket(flight.id, placeId, passengerItem, txtAddInfo.Text);

            Close();
        }

        private void BuyForm_Shown(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("id");
            dt.Columns.Add("value");

            foreach (place placeItem in flight.aircraft.freePlaceList)
            {
                dt.Rows.Add(placeItem.id, placeItem.seatLetter + placeItem.seatNumber);
            }


            comboPlaces.DataSource = dt;
            comboPlaces.DisplayMember = "value";
            comboPlaces.ValueMember = "id";
            comboPlaces.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }
        
        
    }
}
