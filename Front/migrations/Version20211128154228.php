<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211128154228 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE carousel ADD description VARCHAR(255) DEFAULT NULL, ADD teaser VARCHAR(50) DEFAULT NULL');
        $this->addSql('ALTER TABLE category DROP FOREIGN KEY FK_64C19C1DD62C21B');
        $this->addSql('DROP INDEX IDX_64C19C1DD62C21B ON category');
        $this->addSql('ALTER TABLE category DROP child_id');
        $this->addSql('ALTER TABLE product CHANGE mark mark VARCHAR(50) DEFAULT NULL');
        $this->addSql('ALTER TABLE user CHANGE roles roles JSON NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE carousel DROP description, DROP teaser');
        $this->addSql('ALTER TABLE category ADD child_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE category ADD CONSTRAINT FK_64C19C1DD62C21B FOREIGN KEY (child_id) REFERENCES category (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_64C19C1DD62C21B ON category (child_id)');
        $this->addSql('ALTER TABLE product CHANGE mark mark VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE user CHANGE roles roles JSON DEFAULT NULL');
    }
}
