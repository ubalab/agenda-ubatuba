# Agenda Ubatuba

## Início dos trabalhos

Estou aproveitando a oportunidade para reaprender a respeito da organização de projetos 
feitos com Drupal, levando em conta as práticas atuais de desenvolvimento distribuído.
Nesse primeiro momento, vou documentar o processo de configuração do sistema básico para
ambiente Debian e/ou derivados.

### Instalar o tasksel
~~~~
sudo apt-get install tasksel
~~~~


### Instalar LAMP
~~~~
sudo tasksel install lamp-server
~~~~

### Habilitar mod_rewrite no Apache2
~~~~
sudo a2enmod rewrite
sudo service apache2 restart
~~~~

### Instalar a extensão GD para PHP
~~~~
sudo apt-get install php5-gd
~~~~

## Drupal

### Instalação do drush

Não vamos cobrir aqui a instalação do drush. Recomendo o uso da documentação oficial dele:

https://github.com/drush-ops/drush

### Core do Drupal

Com o drush instalado, vamos primeiro baixar o drupal. Para facilitar, vamos instalá-lo numa pasta "agenda" dentro de /var/www:

~~~~

sudo drush dl -y --destination=/var/www --drupal-project-rename=agenda;

~~~~

### Instalando o site

Vamos agora configurar um site. Antes de dar o comando, modifique os seguintes parâmetros para adequar-se a seus dados:

* account-email: o email associado à conta do usuário administrador;
* account-name: o nome do usuário administrador;
* account-pass: senha do usuário administrador;
* db-url deve ser modificado para os dados de sua instalação MySQL.

~~~~
cd /var/www/agenda
sudo drush site-install -y standard --account-mail=seuemail@email.ema --account-name=agenda --account-pass=umasenhaqualquer --site-name="Agenda Ubatuba" --site-mail=noreply@agenda.ubatuba.cc --locale=pt-br --db-url=mysql://usuariomysql:senhamysql@localhost/nomedabase
~~~~

#### Clean URLs

Para garantir que as URLs limpas funcionem, você vai precisar adicionar as linhas abaixo ao arquivo de configuração do Apache (geralmente localizado em /etc/apache2/sites-enabled/000-default.conf ou algo parecido).

<Directory /var/www/agenda/>
  Options FollowSymLinks
  AllowOverride All
  Require all granted
</Directory>

### Módulos adicionais comuns

Agora o sistema básico já está instalado. Mas antes de começar a customizar o site, vamos organizar a casa:
* remover alguns módulos;
* instalar uma série de módulos adicionais;
* configurar para que somente o admin possa criar novos usuários.

~~~~
sudo drush -y dis color toolbar shortcut overlay
sudo drush -y dl ctools views token metatag smtp libraries xmlsitemap pathauto admin mollom google_analytics backup_migrate
sudo drush -y en ctools views token metatag smtp libraries xmlsitemap pathauto admin mollom google_analytics backup_migrate
sudo drush vset -y user_register 0
~~~~
