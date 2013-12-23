#ifndef CHATBOX_H
#define CHATBOX_H

#include <QDialog>

namespace Ui {
class ChatBox;
}

class WalletModel;

class ChatBox : public QDialog
{
    Q_OBJECT
    
public:
    explicit ChatBox(QWidget *parent = 0);
    ~ChatBox();

    void setModel(WalletModel *model);
    QWidget *setupTabChain(QWidget *prev);
    
private:
    Ui::ChatBox *ui;
    WalletModel *model;
};

#endif // CHATBOX_H
