#include "chatbox.h"
#include "ui_chatbox.h"
#include "walletmodel.h"
#include <QMessageBox>
#include <QLocale>
#include <QTextDocument>
#include <QScrollBar>

ChatBox::ChatBox(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::ChatBox),
    model(0)
{
    ui->setupUi(this);
}

ChatBox::~ChatBox()
{
    delete ui;
}
