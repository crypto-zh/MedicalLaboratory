using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Views.Windows;
using Microsoft.Win32;
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using Word = Microsoft.Office.Interop.Word;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для ReportPage.xaml
    /// </summary>
    public partial class ReportPage : Page
    {
        private Word.Document document = null;
        public ReportPage()
        {
            InitializeComponent();
            
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "csv files (.csv)|.csv|pdf files (*.pdf)|*.pdf";
            saveFileDialog.ShowDialog();
            StringBuilder sb = new StringBuilder();
            sb.Append("Номер заявки, Дата, Клиент, Сотрудник, Услуги, Сумма заказа");
            sb.AppendLine();
            if (!String.IsNullOrEmpty(saveFileDialog.FileName))
            {
                if (saveFileDialog.FilterIndex == 1)
                {
                    try
                    {
                        foreach (var row in MedicalLaboratoryEntities.getContext().RequestWithServices.ToList().OrderByDescending(p => p.DateOfCreation))
                        {
                            sb.Append(row.Id + ", ");
                            sb.Append(row.DateOfCreation + ", ");
                            sb.Append(row.ClientInfo + ", ");
                            sb.Append(row.UserInfo + ", ");
                            sb.Append(row.Services + ", ");
                            sb.Append(row.Summ);
                            sb.AppendLine();
                        }
                        File.WriteAllText(saveFileDialog.FileName, sb.ToString());
                    }
                    catch
                    {
                        MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else if (saveFileDialog.FilterIndex == 2)
                {
                    formDocument();
                    document.SaveAs2(@saveFileDialog.FileName, Word.WdExportFormat.wdExportFormatPDF);

                }
                MessageBox.Show("Отчет сохранен", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            formDocument();
            document.Application.Dialogs[Microsoft.Office.Interop.Word.WdWordDialog.wdDialogFilePrint].Show();
            document.Application.Quit();
            document = null;
        }
        private void formDocument()
        {
            try
            {

                    double resultSum = 0;
                    var rows = dGridRequest.ItemsSource.Cast<RequestWithServices>().ToList();
                    if(rows.Count == 0)
                    {
                        MessageBox.Show("Нет заказов за выбранный период", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    var app = new Word.Application();
                    document = app.Documents.Add();
                    Word.Paragraph tableParagraph = document.Paragraphs.Add();
                    Word.Range tableRange = tableParagraph.Range;
                    Word.Table table = document.Tables.Add(tableRange, rows.Count + 1, 6);
                    table.Borders.InsideLineStyle = table.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
                    table.Range.Cells.VerticalAlignment = Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;

                    Word.Range cellRange;
                    cellRange = table.Cell(1, 1).Range;
                    cellRange.Text = "Номер заказа";
                    cellRange = table.Cell(1, 2).Range;
                    cellRange.Text = "Дата";
                    cellRange = table.Cell(1, 3).Range;
                    cellRange.Text = "Клиент";
                    cellRange = table.Cell(1, 4).Range;
                    cellRange.Text = "Сотрудник";
                    cellRange = table.Cell(1, 5).Range;
                    cellRange.Text = "Услуги";
                    cellRange = table.Cell(1, 6).Range;
                    cellRange.Text = "Сумма заказа";

                    table.Rows[1].Range.Bold = 1;
                    int currentRow = 1;
                    foreach (var row in rows)
                    {
                        currentRow++;
                        cellRange = table.Cell(currentRow, 1).Range;
                        cellRange.Text = row.Id.ToString();
                        cellRange = table.Cell(currentRow, 2).Range;
                        cellRange.Text = row.DateOfCreation.ToShortDateString();
                        cellRange = table.Cell(currentRow, 3).Range;
                        cellRange.Text = row.ClientInfo;
                        cellRange = table.Cell(currentRow, 4).Range;
                        cellRange.Text = row.UserInfo;
                        cellRange = table.Cell(currentRow, 5).Range;
                        cellRange.Text = row.Services;
                        cellRange = table.Cell(currentRow, 6).Range;
                        cellRange.Text = $"{row.Summ:f2}₽";
                        resultSum += Convert.ToDouble(row.Summ);
                    }

                    document.Paragraphs.Add();
                    Word.Paragraph sum = document.Paragraphs.Add();
                    sum.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;
                    Word.Range sumRange = sum.Range;
                    sumRange.Bold = 1;
                    sumRange.Text = "Итого: " + resultSum + " руб.";
            }
            catch
            {
                MessageBox.Show("Ошибка в формировании отчета", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            try
            {
                dGridRequest.ItemsSource = MedicalLaboratoryEntities.getContext().RequestWithServices.ToList();
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
                    (window as BaseWindow).Title = "Отчетность";
                }
            }
        }

        private void btnAccept_Click(object sender, RoutedEventArgs e)
        {
            if (datePickerFrom.SelectedDate != null && datePickerUntill.SelectedDate != null)
            {
                if (datePickerFrom.SelectedDate < datePickerUntill.SelectedDate)
                {
                    dGridRequest.ItemsSource = MedicalLaboratoryEntities.getContext().RequestWithServices.Where(p => p.DateOfCreation > datePickerFrom.SelectedDate && p.DateOfCreation < datePickerUntill.SelectedDate).ToList();
                    if (dGridRequest.Items.Count == 0)
                    {
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Начальная дата не можеть быть меньше конечной", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }
            }
            else
            {
                dGridRequest.ItemsSource = MedicalLaboratoryEntities.getContext().RequestWithServices.ToList();
            }
        }
    }
}
