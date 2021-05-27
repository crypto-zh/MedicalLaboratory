using MedicalLaboratory.Data.BaseModel;
using System;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEditClientWindow.xaml
    /// </summary>
    public partial class AddEditClientWindow : Window
    {
        private Page parrentPage;
        private Client currentClient;
        public AddEditClientWindow(Client client, Page page)
        {
            InitializeComponent();
            parrentPage = page;
            this.Title = "Добавление клиента";
            currentClient = new Client();
            if (client != null)
            {
                currentClient = client;
                this.Title = "Редактирование клиента";
            }
            DataContext = currentClient;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (String.IsNullOrEmpty(currentClient.LastName))
                stringBuilder.AppendLine("Введите фамилию");
            if (String.IsNullOrEmpty(currentClient.FirstName))
                stringBuilder.AppendLine("Введите имя");
            if (!txtPhone.IsMaskCompleted)
                stringBuilder.AppendLine("Введите номер телефона");
            if (stringBuilder.Length != 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                if (currentClient.Id == 0)
                {
                    MedicalLaboratoryEntities.getContext().Client.Add(currentClient);
                }
                MedicalLaboratoryEntities.getContext().SaveChanges();
                MessageBox.Show("Данные сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                if (parrentPage != null)
                {
                    parrentPage.Visibility = Visibility.Collapsed;
                    parrentPage.Visibility = Visibility.Visible;
                }
                this.Close();
            }
            catch
            {
                MessageBox.Show("Ошибка соединения с базой", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
