using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Views.Windows;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для ClientsPage.xaml
    /// </summary>
    public partial class ClientsPage : Page
    {
        public ClientsPage()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddEditClientWindow addEditClientWindow = new AddEditClientWindow(null, this);
            addEditClientWindow.ShowDialog();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var clients = dGridClients.SelectedItems.Cast<Client>().ToList();
            if (clients.Count != 0)
            {
                if (MessageBox.Show($"Вы точно хотите удалить следующие {clients.Count()} элементов?", "Информация", MessageBoxButton.YesNo, MessageBoxImage.Information) == MessageBoxResult.Yes)
                {
                    try
                    {
                        MedicalLaboratoryEntities.getContext().Client.RemoveRange(clients);
                        MedicalLaboratoryEntities.getContext().SaveChanges();
                        MessageBox.Show("Данные удалены!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        dGridClients.ItemsSource = MedicalLaboratoryEntities.getContext().Client.ToList();
                    }
                    catch
                    {
                        MessageBox.Show("Ошибка в удалении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите элемент", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            AddEditClientWindow addEditClientWindow = new AddEditClientWindow((sender as Button).DataContext as Client, this);
            addEditClientWindow.ShowDialog();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            try
            {
                dGridClients.ItemsSource = MedicalLaboratoryEntities.getContext().Client.ToList();
            }
            catch
            {
                MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType() == typeof(BaseWindow))
                {
                    (window as BaseWindow).Title = "Клиенты";
                }
            }
        }

        private void txtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBoxSearch.Text))
            {
                try
                {
                    dGridClients.ItemsSource = MedicalLaboratoryEntities.getContext().Client.Where(p =>
                    p.FirstName.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) ||
                         p.LastName.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) ||
                         p.Patronymic.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower())).ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    dGridClients.ItemsSource = MedicalLaboratoryEntities.getContext().Client.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
