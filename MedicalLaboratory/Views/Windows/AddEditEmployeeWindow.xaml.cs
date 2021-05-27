using MedicalLaboratory.Data.BaseModel;
using System;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEditEmployeeWindow.xaml
    /// </summary>
    public partial class AddEditEmployeeWindow : Window
    {
        private static Employee currentEmployee;
        private Page parrentPage;
        public AddEditEmployeeWindow(Employee employee, Page page)
        {
            InitializeComponent();
            parrentPage = page;
            this.Title = "Добавление сотрудника";
            try
            {
                comboPost.ItemsSource = MedicalLaboratoryEntities.getContext().Post.ToList();
            }
            catch
            {
                MessageBox.Show("Ошибка получения данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            currentEmployee = new Employee();
            if (employee != null)
            {
                currentEmployee = employee;
                this.Title = "Редактирование сотрудника";
            }
            DataContext = currentEmployee;
           
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (String.IsNullOrEmpty(currentEmployee.LastName))
                stringBuilder.AppendLine("Введите фамилию");
            if (String.IsNullOrEmpty(currentEmployee.FirstName))
                stringBuilder.AppendLine("Введите имя");
            if (!txtPhone.IsMaskCompleted)
                stringBuilder.AppendLine("Введите номер телефона");
            if (String.IsNullOrEmpty(currentEmployee.Email) || !currentEmployee.Email.Contains('@'))
                stringBuilder.AppendLine("Введите корректную почту");
            if (comboPost.SelectedItem == null)
                stringBuilder.AppendLine("Выберите должность сотрудника");
            if (stringBuilder.Length != 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                if (currentEmployee.Id == 0)
                {
                    MedicalLaboratoryEntities.getContext().Employee.Add(currentEmployee);
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
    }
}
