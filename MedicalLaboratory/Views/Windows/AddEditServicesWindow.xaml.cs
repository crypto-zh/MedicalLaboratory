using MedicalLaboratory.Data.BaseModel;
using System;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace MedicalLaboratory.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEditServicesWindow.xaml
    /// </summary>
    public partial class AddEditServicesWindow : Window
    {
        private static Service currentService;
        private Page parrentPage;
        public AddEditServicesWindow(Service service, Page page)
        {
            InitializeComponent();
            this.Title = "Добавление услуги";
            int[] comboValues = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            comboDays.ItemsSource = comboValues;
            parrentPage = page;
            currentService = new Service();
            if (service != null)
            {
                currentService = service;
                this.Title = "Редактирование услуги";
                comboDays.SelectedItem = service.DeadlineForCompletion;
            }
            DataContext = currentService;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (String.IsNullOrEmpty(currentService.Title))
                stringBuilder.AppendLine("Введите название");
            if (comboDays.SelectedItem == null)
                stringBuilder.AppendLine("Выберите срок выполнения");
            if (currentService.Cost<=0)
                stringBuilder.AppendLine("Введите корректную стоимость");
            if (stringBuilder.Length != 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                currentService.DeadlineForCompletion = (int)comboDays.SelectedItem;
                if (currentService.Id==0)
                {
                    MedicalLaboratoryEntities.getContext().Service.Add(currentService);
                }
                MedicalLaboratoryEntities.getContext().SaveChanges();
                MessageBox.Show("Данные сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                parrentPage.Visibility = Visibility.Collapsed;
                parrentPage.Visibility = Visibility.Visible;
                this.Close();
            }
            catch
            {
                MessageBox.Show("Ошибка соединения с базой", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void txtCost_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!(Char.IsDigit(e.Text, 0) || (e.Text == ".")
               && (!txtCost.Text.Contains(".")
               && txtCost.Text.Length != 0)))
            {
                e.Handled = true;
            }
        }
    }
}
