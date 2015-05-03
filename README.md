# Agenda Ubatuba

## Início dos trabalhos

Estou aproveitando a oportunidade para reaprender a respeito da organização de projetos 
feitos com Drupal, levando em conta as práticas atuais de desenvolvimento distribuído.
Nesse primeiro momento, vou documentar o processo de configuração do sistema básico para
ambiente Debian e/ou derivados.

1. Instalar LAMP
'sudo tasksel install lamp-server'

2. Habilitar mod_rewrite no Apache2
'''
sudo a2enmod rewrite
sudo service apache2 restart
'''

3. Instalar a extensão GD para PHP
'sudo apt-get install php5-gd'

