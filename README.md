# Agenda Ubatuba

## Início dos trabalhos

Estou aproveitando a oportunidade para reaprender a respeito da organização de projetos 
feitos com Drupal, levando em conta as práticas atuais de desenvolvimento distribuído.
Nesse primeiro momento, vou documentar o processo de configuração do sistema básico para
ambiente Debian e/ou derivados.

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

