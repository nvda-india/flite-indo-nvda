﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;
using Microsoft.Win32;
using System.Diagnostics;


namespace Hear2Read_TTS_App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            string voxdir;
            string languageName;
            int LanguageCount = 0;

            InitializeComponent();

            // Find installed voices in c:/program files(x86)/Hear2Read/Languages
            //Find installed Voices and display them
            RegistryKey myKey = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens", false);
            string[] tokensArray = myKey.GetSubKeyNames();
            // Check Each Token to see if it is a Hear2Read Voice (voxdir will be defined if this is a Hear2Read voice)
            foreach (string Token in tokensArray)
            {
                if (Token != "")
                {
                    RegistryKey myKey2 = myKey.OpenSubKey(Token, false);
                    if ((voxdir = (string)myKey2.GetValue("voxdir", "")) != "")
                    {
                        if (File.Exists(voxdir))
                        {
                            RegistryKey myKey3 = myKey2.OpenSubKey("Attributes", false);
                            if ((languageName = (string)myKey3.GetValue("Name", "")) != "")
                            {
                                LanguageCount += 1;
                                //Display the Installed Voice name in the VoiceList
                                TextBlock myTextBlock = new TextBlock
                                {
                                    TextWrapping = TextWrapping.Wrap,
                                    Margin = new Thickness(5, 5, 5, 5),
                                    FontSize = 25,
                                    Text = languageName
                                };
                                myTextBlock.Foreground = new System.Windows.Media.SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF101fbb"));
                                myTextBlock.Background = new System.Windows.Media.SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFDDDDDD"));

                                VoiceList.Children.Add(myTextBlock);
                            }
                        }
                    }
                }
            }
            if (LanguageCount == 0)
            {
                TextBlock myTextBlock = new TextBlock
                {
                    TextWrapping = TextWrapping.Wrap,
                    Margin = new Thickness(5, 5, 5, 5),
                    FontSize = 25,
                    Text = "No Languages are installed on this PC",
                    TextAlignment = TextAlignment.Center
                };
                myTextBlock.Foreground = new System.Windows.Media.SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF101fbb"));
                myTextBlock.Background = new System.Windows.Media.SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFDDDDDD"));

                VoiceList.Children.Add(myTextBlock);
            }
        }

        private void Logo_Click(object sender, RoutedEventArgs e)
        {
                       try
                       {
                           System.Diagnostics.Process.Start("http://www.hear2read.org/");
                      }
                       catch { }
        }
        private void Get_Voices(object sender, RoutedEventArgs e)
        {
                       try
                       {
                         System.Diagnostics.Process.Start("http://www.hear2read.org/TTS_for_windows.php");
                       }
                       catch { }
        }
    }
}
